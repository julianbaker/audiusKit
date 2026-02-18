#!/usr/bin/env bash
set -euo pipefail

SWAGGER_PATH="${1:-${AUDIUSKIT_SWAGGER_PATH:-swagger.yaml}}"
FILES=(
  "Sources/AudiusKit/Generated/AudiusModels.generated.swift"
  "Sources/AudiusKit/Generated/AudiusTypedOperationParams.generated.swift"
  "Sources/AudiusKit/Generated/AudiusTypedAPIs.generated.swift"
  "Tests/AudiusKitTests/Fixtures/operation_manifest.json"
)

BEFORE=()
for file in "${FILES[@]}"; do
  BEFORE+=("$(shasum "$file" | awk '{print $1}')")
done

ruby Scripts/generate_typed_surface.rb "$SWAGGER_PATH"
ruby Scripts/generate_operation_manifest.rb "$SWAGGER_PATH" "Tests/AudiusKitTests/Fixtures/operation_manifest.json"

for i in "${!FILES[@]}"; do
  file="${FILES[$i]}"
  after="$(shasum "$file" | awk '{print $1}')"
  if [[ "${BEFORE[$i]}" != "$after" ]]; then
    echo "Generated artifacts changed after regeneration: $file"
    exit 1
  fi
done

echo "Codegen artifacts are up to date."
