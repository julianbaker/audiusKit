#!/usr/bin/env ruby
# frozen_string_literal: true

require "set"
require "yaml"

DEFAULT_SWAGGER = "/Users/julianbaker/Downloads/swagger.yaml"
OPERATIONS_FILE = "Sources/AudiusKit/Generated/AudiusOperations.generated.swift"
MODELS_OUTPUT = "Sources/AudiusKit/Generated/AudiusModels.generated.swift"
PARAMS_OUTPUT = "Sources/AudiusKit/Generated/AudiusTypedOperationParams.generated.swift"
APIS_OUTPUT = "Sources/AudiusKit/Generated/AudiusTypedAPIs.generated.swift"
METHODS = %w[get post put delete].freeze

SWIFT_KEYWORDS = %w[
  associatedtype class deinit enum extension fileprivate func import init inout internal let operator
  private protocol public static struct subscript typealias var break case continue default defer do else
  fallthrough for guard if in repeat return switch where while as Any catch false is nil rethrows super self
  Self throw throws true try _ convenience dynamic didSet final get infix indirect lazy left mutating none
  nonmutating optional override postfix precedence prefix Protocol required right set Type unowned weak willSet
].to_set

Operation = Struct.new(
  :operation_case,
  :method,
  :path,
  :tag,
  :auth,
  :parameters,
  :request_body_schema,
  :request_body_required,
  :response_schema,
  keyword_init: true
)

Parameter = Struct.new(
  :name,
  :location,
  :required,
  :explode,
  :schema,
  keyword_init: true
)

class Generator
  def initialize(swagger_path)
    @swagger = YAML.load_file(swagger_path)
    @components = @swagger.fetch("components", {})
    @schemas = @components.fetch("schemas", {})
    @schema_type_names = assign_schema_type_names
    @envelope_shapes = build_envelope_shape_map
    @operation_specs = load_operation_specs
    @operations = build_operations
  end

  def generate!
    write(MODELS_OUTPUT, generate_models)
    write(PARAMS_OUTPUT, generate_params)
    write(APIS_OUTPUT, generate_typed_apis)
  end

  private

  def write(path, content)
    File.write(path, content)
  end

  def normalize_path(path)
    path.sub(%r{^/v1/}, "").sub(%r{^/}, "")
  end

  def load_operation_specs
    specs = {}
    pattern = /AudiusOperationSpec\(operation: \.([A-Za-z0-9_]+), operationId: "(?:\\.|[^"])*", method: \.(get|post|put|delete), path: "([^"]+)", tag: \.([A-Za-zA-Z0-9]+), auth: \.([A-Za-zA-Z0-9]+)\)/

    File.read(OPERATIONS_FILE).scan(pattern) do |operation_case, method, path, tag, auth|
      key = "#{method.upcase} #{path}"
      specs[key] = {
        operation_case: operation_case,
        method: method,
        path: path,
        tag: tag,
        auth: auth
      }
    end

    specs
  end

  def build_operations
    operations = []

    (@swagger["paths"] || {}).each do |raw_path, item|
      METHODS.each do |method|
        op = item[method]
        next unless op

        path = normalize_path(raw_path)
        key = "#{method.upcase} #{path}"
        spec = @operation_specs[key]
        raise "Missing operation mapping for #{key}" unless spec

        parameters = merged_parameters(item["parameters"], op["parameters"])

        request_body = op["requestBody"] || {}
        request_body_schema = request_body.dig("content", "application/json", "schema")
        request_body_required = request_body["required"] == true

        response_schema = select_response_schema(op["responses"] || {})

        operations << Operation.new(
          operation_case: spec[:operation_case],
          method: method,
          path: path,
          tag: spec[:tag],
          auth: spec[:auth],
          parameters: parameters,
          request_body_schema: request_body_schema,
          request_body_required: request_body_required,
          response_schema: response_schema
        )
      end
    end

    operations.sort_by { |op| [op.tag, op.operation_case] }
  end

  def merged_parameters(path_params, op_params)
    merged = {}
    (path_params || []).each do |param|
      merged[[param["in"], param["name"]]] = param
    end
    (op_params || []).each do |param|
      merged[[param["in"], param["name"]]] = param
    end

    merged.values.map do |param|
      schema = param["schema"]
      if schema.nil? && param["content"]
        media = param["content"]["application/json"] || param["content"].values.first
        schema = media && media["schema"]
      end
      Parameter.new(
        name: param["name"],
        location: param["in"],
        required: param["required"] == true,
        explode: param.key?("explode") ? param["explode"] : true,
        schema: schema || {}
      )
    end.sort_by { |param| [param.location, param.name] }
  end

  def select_response_schema(responses)
    preferred = responses["200"] || responses["201"]
    preferred ||= responses.keys.sort.find { |code| code.start_with?("2") }
    preferred = responses[preferred] if preferred.is_a?(String)
    preferred ||= responses.values.first
    preferred&.dig("content", "application/json", "schema")
  end

  def assign_schema_type_names
    used = Set.new
    mapping = {}

    @schemas.keys.sort.each do |name|
      base = swift_type_name(name)
      candidate = base

      if used.include?(candidate)
        candidate = "#{base}Model"
        index = 2
        while used.include?(candidate)
          candidate = "#{base}Model#{index}"
          index += 1
        end
      end

      mapping[name] = candidate
      used << candidate
    end

    mapping
  end

  def swift_type_name(name)
    segments = name.to_s
      .gsub(/([a-z0-9])([A-Z])/, "\\1_\\2")
      .split(/[^A-Za-z0-9]+/)
      .reject(&:empty?)

    value = segments.map { |segment| segment[0].upcase + segment[1..].to_s.downcase }.join
    value = "Model" if value.empty?
    value = "Model#{value}" if value.match?(/\A\d/)
    value
  end

  def swift_member_name(name)
    segments = name.to_s
      .gsub(/([a-z0-9])([A-Z])/, "\\1_\\2")
      .split(/[^A-Za-z0-9]+/)
      .reject(&:empty?)

    value = if segments.empty?
      "value"
    else
      [segments.first.downcase, *segments.drop(1).map { |segment| segment[0].upcase + segment[1..].to_s.downcase }].join
    end

    value = "field" if value.empty?
    value = "value#{value}" if value.match?(/\A\d/)
    value = "#{value}Value" if SWIFT_KEYWORDS.include?(value)
    value
  end

  def unique_member_name(base, used)
    candidate = base
    index = 2
    while used.include?(candidate)
      candidate = "#{base}#{index}"
      index += 1
    end
    used << candidate
    candidate
  end

  def schema_ref_name(ref)
    ref.to_s.split("/").last
  end

  def type_for_ref(ref)
    @schema_type_names.fetch(schema_ref_name(ref))
  end

  def non_optional(type)
    type.end_with?("?") ? type[0..-2] : type
  end

  def swift_type_for_schema(schema, required: true)
    return required ? "JSONValue" : "JSONValue?" unless schema.is_a?(Hash)
    schema ||= {}
    nullable = schema["nullable"] == true

    base = if schema["$ref"]
      type_for_ref(schema["$ref"])
    elsif schema["allOf"] || schema["oneOf"] || schema["anyOf"]
      "JSONValue"
    else
      case schema["type"]
      when "string"
        schema["format"] == "date-time" ? "Date" : "String"
      when "integer"
        "Int"
      when "number"
        "Double"
      when "boolean"
        "Bool"
      when "array"
        item_type = non_optional(swift_type_for_schema(schema["items"] || {}, required: true))
        "[#{item_type}]"
      when "object"
        if schema["additionalProperties"]
          value_type = non_optional(swift_type_for_schema(schema["additionalProperties"], required: true))
          "[String: #{value_type}]"
        elsif (schema["properties"] || {}).any?
          "JSONValue"
        else
          "JSONValue"
        end
      else
        "JSONValue"
      end
    end

    required && !nullable ? base : "#{base}?"
  end

  def build_envelope_shape_map
    shapes = {}

    @schemas.each do |name, schema|
      props = schema["properties"] || {}
      next unless props.keys == ["data"]

      data_schema = props["data"] || {}
      if data_schema["type"] == "array"
        item_type = non_optional(swift_type_for_schema(data_schema["items"] || {}, required: true))
        shapes[name] = "AudiusListEnvelope<#{item_type}>"
      elsif data_schema["nullable"] == true
        base = non_optional(swift_type_for_schema(data_schema, required: true))
        shapes[name] = "AudiusOptionalEnvelope<#{base}>"
      else
        base = non_optional(swift_type_for_schema(data_schema, required: true))
        shapes[name] = "AudiusEnvelope<#{base}>"
      end
    end

    shapes
  end

  def response_type_for_schema(schema)
    return "AudiusHTTPResponse<Data>" unless schema

    if schema["$ref"]
      ref_name = schema_ref_name(schema["$ref"])
      return @envelope_shapes[ref_name] if @envelope_shapes[ref_name]
      return type_for_ref(schema["$ref"])
    end

    if schema["type"] == "object"
      props = schema["properties"] || {}
      if props.keys == ["data"]
        data_schema = props["data"] || {}
        if data_schema["type"] == "array"
          item_type = non_optional(swift_type_for_schema(data_schema["items"] || {}, required: true))
          return "AudiusListEnvelope<#{item_type}>"
        elsif data_schema["nullable"] == true
          base = non_optional(swift_type_for_schema(data_schema, required: true))
          return "AudiusOptionalEnvelope<#{base}>"
        else
          base = non_optional(swift_type_for_schema(data_schema, required: true))
          return "AudiusEnvelope<#{base}>"
        end
      end
    end

    non_optional(swift_type_for_schema(schema, required: true))
  end

  def generate_models
    lines = []
    lines << "import Foundation"
    lines << ""

    @schemas.keys.sort.each do |schema_name|
      schema = @schemas.fetch(schema_name)
      type_name = @schema_type_names.fetch(schema_name)

      lines.concat(generate_schema_type(type_name, schema))
      lines << ""
    end

    lines.join("\n")
  end

  def generate_schema_type(type_name, schema)
    if schema["enum"]
      return generate_enum(type_name, schema)
    end

    if schema["allOf"] || schema["oneOf"] || schema["anyOf"]
      return generate_json_wrapper(type_name)
    end

    if schema["type"] == "object" || schema["properties"]
      return generate_object(type_name, schema)
    end

    generate_primitive_wrapper(type_name, schema)
  end

  def generate_enum(type_name, schema)
    raw_type = schema["type"] == "integer" ? "Int" : "String"
    values = schema["enum"] || []

    used = Set.new
    cases = values.map do |value|
      base = if value.is_a?(String)
        swift_member_name(value)
      else
        swift_member_name("value#{value}")
      end
      name = unique_member_name(base, used)
      "  case #{name} = #{value.inspect}"
    end

    [
      "public enum #{type_name}: #{raw_type}, Sendable, Codable, CaseIterable {",
      *cases,
      "}"
    ]
  end

  def generate_json_wrapper(type_name)
    [
      "public struct #{type_name}: Sendable, Codable, Equatable {",
      "  public var value: JSONValue",
      "",
      "  public init(value: JSONValue) {",
      "    self.value = value",
      "  }",
      "",
      "  public init(from decoder: Decoder) throws {",
      "    self.value = try JSONValue(from: decoder)",
      "  }",
      "",
      "  public func encode(to encoder: Encoder) throws {",
      "    try value.encode(to: encoder)",
      "  }",
      "}"
    ]
  end

  def generate_object(type_name, schema)
    properties = schema["properties"] || {}
    required_set = Set.new(schema["required"] || [])

    if properties.empty?
      return [
        "public struct #{type_name}: Sendable, Codable, Equatable {",
        "  public var raw: [String: JSONValue]",
        "",
        "  public init(raw: [String: JSONValue] = [:]) {",
        "    self.raw = raw",
        "  }",
        "}",
      ]
    end

    used = Set.new
    fields = properties.keys.sort.map do |json_key|
      swift_name = unique_member_name(swift_member_name(json_key), used)
      swift_type = swift_type_for_schema(properties[json_key], required: required_set.include?(json_key))
      {
        json_key: json_key,
        swift_name: swift_name,
        swift_type: swift_type,
        optional: swift_type.end_with?("?")
      }
    end

    lines = []
    lines << "public struct #{type_name}: Sendable, Codable, Equatable {"
    fields.each do |field|
      lines << "  public var #{field[:swift_name]}: #{field[:swift_type]}"
    end

    lines << ""
    init_parameters = fields.map do |field|
      default = field[:optional] ? " = nil" : ""
      "#{field[:swift_name]}: #{field[:swift_type]}#{default}"
    end

    lines << "  public init(#{init_parameters.join(', ')}) {"
    fields.each do |field|
      lines << "    self.#{field[:swift_name]} = #{field[:swift_name]}"
    end
    lines << "  }"

    if fields.any? { |field| field[:json_key] != field[:swift_name] }
      lines << ""
      lines << "  enum CodingKeys: String, CodingKey {"
      fields.each do |field|
        if field[:json_key] == field[:swift_name]
          lines << "    case #{field[:swift_name]}"
        else
          lines << "    case #{field[:swift_name]} = \"#{field[:json_key]}\""
        end
      end
      lines << "  }"
    end

    lines << "}"
    lines
  end

  def generate_primitive_wrapper(type_name, schema)
    base = non_optional(swift_type_for_schema(schema, required: true))

    [
      "public struct #{type_name}: Sendable, Codable, Equatable {",
      "  public var value: #{base}",
      "",
      "  public init(value: #{base}) {",
      "    self.value = value",
      "  }",
      "",
      "  public init(from decoder: Decoder) throws {",
      "    let container = try decoder.singleValueContainer()",
      "    self.value = try container.decode(#{base}.self)",
      "  }",
      "",
      "  public func encode(to encoder: Encoder) throws {",
      "    var container = encoder.singleValueContainer()",
      "    try container.encode(value)",
      "  }",
      "}"
    ]
  end

  def params_struct_name(operation_case)
    "#{operation_case[0].upcase}#{operation_case[1..]}Params"
  end

  def response_alias_name(operation_case)
    "#{operation_case[0].upcase}#{operation_case[1..]}TypedResponse"
  end

  def generate_params
    lines = []
    lines << "import Foundation"
    lines << ""

    @operations.each do |operation|
      lines.concat(generate_operation_params(operation))
      lines << ""
    end

    lines.join("\n")
  end

  def generate_operation_params(operation)
    params_name = params_struct_name(operation.operation_case)

    path_params = operation.parameters.select { |param| param.location == "path" }
    query_params = operation.parameters.select { |param| param.location == "query" }
    header_params = operation.parameters.select { |param| param.location == "header" }

    used_names = Set.new
    fields = []

    path_params.each do |param|
      fields << build_field(param, used_names, suffix: "Path")
    end
    query_params.each do |param|
      fields << build_field(param, used_names, suffix: "Query")
    end
    header_params.each do |param|
      fields << build_field(param, used_names, suffix: "Header")
    end

    body_type = nil
    body_optional = true
    if operation.request_body_schema
      body_type = swift_type_for_schema(operation.request_body_schema, required: operation.request_body_required)
      body_optional = body_type.end_with?("?")
      body_type = non_optional(body_type)
      fields << {
        json_name: "body",
        swift_name: unique_member_name("body", used_names),
        swift_type: body_optional ? "#{body_type}?" : body_type,
        location: "body",
        required: !body_optional,
        explode: true,
        schema: operation.request_body_schema
      }
    end

    lines = []
    lines << "public struct #{params_name}: Sendable {"
    fields.each do |field|
      lines << "  public var #{field[:swift_name]}: #{field[:swift_type]}"
    end

    lines << ""
    init_parts = fields.map do |field|
      default = field[:required] ? "" : " = nil"
      "#{field[:swift_name]}: #{field[:swift_type]}#{default}"
    end

    lines << "  public init(#{init_parts.join(', ')}) {"
    fields.each do |field|
      lines << "    self.#{field[:swift_name]} = #{field[:swift_name]}"
    end
    lines << "  }"

    lines << ""
    lines << "  func pathParameters() -> [String: String] {"
    path_fields = fields.select { |field| field[:location] == "path" }
    if path_fields.empty?
      lines << "    return [:]"
    else
      lines << "    var values: [String: String] = [:]"
      path_fields.each do |field|
        if field[:required]
          lines << "    values[\"#{field[:json_name]}\"] = AudiusTypedValueCoder.pathString(#{field[:swift_name]})"
        else
          lines << "    if let value = #{field[:swift_name]} {"
          lines << "      values[\"#{field[:json_name]}\"] = AudiusTypedValueCoder.pathString(value)"
          lines << "    }"
        end
      end
      lines << "    return values"
    end
    lines << "  }"

    lines << ""
    lines << "  func queryItems() throws -> [URLQueryItem] {"
    query_fields = fields.select { |field| field[:location] == "query" }
    if query_fields.empty?
      lines << "    return []"
    else
      lines << "    var items: [URLQueryItem] = []"
      query_fields.each do |field|
        schema = field[:schema] || {}
        if schema["type"] == "array"
          if field[:required]
            lines.concat(serialize_array_query(field, explode: field[:explode]))
          else
            lines << "    if let values = #{field[:swift_name]} {"
            lines.concat(serialize_array_query(field, explode: field[:explode], indent: "      ", source: "values"))
            lines << "    }"
          end
        else
          if field[:required]
            lines << "    items.append(URLQueryItem(name: \"#{field[:json_name]}\", value: try AudiusTypedValueCoder.queryString(#{field[:swift_name]})))"
          else
            lines << "    if let value = #{field[:swift_name]} {"
            lines << "      items.append(URLQueryItem(name: \"#{field[:json_name]}\", value: try AudiusTypedValueCoder.queryString(value)))"
            lines << "    }"
          end
        end
      end
      lines << "    return items"
    end
    lines << "  }"

    lines << ""
    lines << "  func headerValues() throws -> [String: String] {"
    header_fields = fields.select { |field| field[:location] == "header" }
    if header_fields.empty?
      lines << "    return [:]"
    else
      lines << "    var values: [String: String] = [:]"
      header_fields.each do |field|
        if field[:required]
          lines << "    values[\"#{field[:json_name]}\"] = try AudiusTypedValueCoder.queryString(#{field[:swift_name]})"
        else
          lines << "    if let value = #{field[:swift_name]} {"
          lines << "      values[\"#{field[:json_name]}\"] = try AudiusTypedValueCoder.queryString(value)"
          lines << "    }"
        end
      end
      lines << "    return values"
    end
    lines << "  }"

    lines << ""
    lines << "  func encodedBody() throws -> JSONValue? {"
    body_field = fields.find { |field| field[:location] == "body" }
    if body_field.nil?
      lines << "    return nil"
    else
      body_type_name = non_optional(body_field[:swift_type])
      if body_type_name == "JSONValue"
        if body_field[:required]
          lines << "    return #{body_field[:swift_name]}"
        else
          lines << "    return #{body_field[:swift_name]}"
        end
      else
        if body_field[:required]
          lines << "    return try AudiusTypedValueCoder.jsonValue(from: #{body_field[:swift_name]})"
        else
          lines << "    guard let body = #{body_field[:swift_name]} else { return nil }"
          lines << "    return try AudiusTypedValueCoder.jsonValue(from: body)"
        end
      end
    end
    lines << "  }"

    lines << "}"
    lines
  end

  def serialize_array_query(field, explode:, indent: "    ", source: field[:swift_name])
    lines = []
    if explode
      lines << "#{indent}for value in #{source} {"
      lines << "#{indent}  items.append(URLQueryItem(name: \"#{field[:json_name]}\", value: try AudiusTypedValueCoder.queryString(value)))"
      lines << "#{indent}}"
    else
      lines << "#{indent}let joined = try #{source}.map { try AudiusTypedValueCoder.queryString($0) }.joined(separator: \",\")"
      lines << "#{indent}items.append(URLQueryItem(name: \"#{field[:json_name]}\", value: joined))"
    end
    lines
  end

  def build_field(param, used_names, suffix:)
    base = swift_member_name(param.name)
    swift_name = unique_member_name(base, used_names)
    if swift_name != base
      swift_name = unique_member_name("#{base}#{suffix}", used_names)
    end

    swift_type = swift_type_for_schema(param.schema, required: param.required)

    {
      json_name: param.name,
      swift_name: swift_name,
      swift_type: swift_type,
      location: param.location,
      required: param.required,
      explode: param.explode,
      schema: param.schema
    }
  end

  def typed_api_name(tag)
    "Typed#{tag[0].upcase}#{tag[1..]}API"
  end

  def generate_typed_apis
    lines = []
    lines << "import Foundation"
    lines << ""

    response_types = {}
    @operations.each do |operation|
      response_types[operation.operation_case] = response_type_for_schema(operation.response_schema)
    end

    @operations.each do |operation|
      lines << "public typealias #{response_alias_name(operation.operation_case)} = #{response_types.fetch(operation.operation_case)}"
    end

    lines << ""
    lines << "public struct AudiusTypedOperationSpec: Sendable, Hashable {"
    lines << "  public let operation: AudiusOperation"
    lines << "  public let method: AudiusHTTPMethod"
    lines << "  public let path: String"
    lines << "  public let tag: AudiusOperationTag"
    lines << "  public let auth: AudiusAuthRequirement"
    lines << ""
    lines << "  public init(operation: AudiusOperation, method: AudiusHTTPMethod, path: String, tag: AudiusOperationTag, auth: AudiusAuthRequirement) {"
    lines << "    self.operation = operation"
    lines << "    self.method = method"
    lines << "    self.path = path"
    lines << "    self.tag = tag"
    lines << "    self.auth = auth"
    lines << "  }"
    lines << "}"
    lines << ""
    lines << "public enum AudiusTypedOperationRegistry {"
    lines << "  public static let all: [AudiusTypedOperationSpec] = ["
    @operations.each do |operation|
      lines << "    AudiusTypedOperationSpec(operation: .#{operation.operation_case}, method: .#{operation.method}, path: \"#{operation.path}\", tag: .#{operation.tag}, auth: .#{operation.auth}),"
    end
    lines << "  ]"
    lines << "}"
    lines << ""

    grouped = @operations.group_by(&:tag)
    grouped.keys.sort.each do |tag|
      api_name = typed_api_name(tag)
      lines << "public extension #{api_name} {"

      grouped[tag].sort_by(&:operation_case).each do |operation|
        params_name = params_struct_name(operation.operation_case)
        response_name = response_alias_name(operation.operation_case)
        response_type = response_types.fetch(operation.operation_case)
        has_required = operation.parameters.any?(&:required) || operation.request_body_required

        lines << "  @discardableResult"
        if has_required
          lines << "  func #{operation.operation_case}(_ params: #{params_name}) async throws -> #{response_name} {"
        else
          lines << "  func #{operation.operation_case}(_ params: #{params_name} = .init()) async throws -> #{response_name} {"
        end

        lines << "    let response = try await perform("
        lines << "      .#{operation.operation_case},"
        lines << "      pathParameters: params.pathParameters(),"
        lines << "      queryItems: try params.queryItems(),"
        lines << "      headers: try params.headerValues(),"
        lines << "      body: try params.encodedBody()"
        lines << "    )"

        if response_type == "AudiusHTTPResponse<Data>"
          lines << "    return response"
        else
          lines << "    return try response.decodeTyped(#{response_name}.self, operation: .#{operation.operation_case})"
        end

        lines << "  }"
        lines << ""
      end

      lines << "}"
      lines << ""
    end

    lines.join("\n")
  end
end

swagger_path = ARGV[0] || DEFAULT_SWAGGER
Generator.new(swagger_path).generate!
puts "Generated typed surface from #{swagger_path}"
