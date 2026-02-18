#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "time"
require "yaml"

DEFAULT_SWAGGER = "/Users/julianbaker/Downloads/swagger.yaml"
DEFAULT_OUTPUT = "Tests/AudiusKitTests/Fixtures/operation_manifest.json"
SUPPORTED_METHODS = %w[get post put delete].freeze

def normalize_tag(tag)
  case tag
  when "developer_apps"
    "developerApps"
  when "dashboard_wallet_users"
    "dashboardWalletUsers"
  else
    tag.to_s
  end
end

def auth_requirement(security)
  return "none" if security.nil? || security.empty?

  schemes = security.flat_map(&:keys).uniq
  has_basic = schemes.include?("BasicAuth")
  has_bearer = schemes.include?("BearerAuth")

  return "basicOrBearer" if has_basic && has_bearer
  return "basic" if has_basic
  return "bearer" if has_bearer

  "none"
end

swagger_path = ARGV[0] || DEFAULT_SWAGGER
output_path = ARGV[1] || DEFAULT_OUTPUT

document = YAML.load_file(swagger_path)
global_security = document["security"]

operations = []
document.fetch("paths", {}).each do |raw_path, definition|
  definition.each do |method, operation|
    next unless SUPPORTED_METHODS.include?(method)

    operation ||= {}
    security = operation.key?("security") ? operation["security"] : global_security
    tag = normalize_tag((operation["tags"] || ["unknown"]).first)
    path = raw_path.sub(%r{^/v1/}, "").sub(%r{^/}, "")

    operations << {
      "operationId" => operation["operationId"] || "#{method}_#{path}",
      "method" => method.upcase,
      "path" => path,
      "tag" => tag,
      "auth" => auth_requirement(security)
    }
  end
end

operations.sort_by! { |op| [op["tag"], op["path"], op["method"], op["operationId"]] }

manifest = {
  "source_swagger" => swagger_path,
  "generated_at" => Time.now.utc.iso8601,
  "operation_count" => operations.count,
  "operations" => operations
}

File.write(output_path, JSON.pretty_generate(manifest) + "\n")
puts "Wrote #{operations.count} operations to #{output_path}"
