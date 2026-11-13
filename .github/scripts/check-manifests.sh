#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../.."

status=0

# Each argument is file:jq-filter.
same() {
  local what=$1 first= report= differs=0 spec file value
  shift
  for spec in "$@"; do
    file=${spec%%:*}
    if ! value=$(jq -er "${spec#*:}" "$file"); then
      echo "::error file=$file::No $what in $file"
      status=1
      continue
    fi
    report+="  $file: $value"$'\n'
    [ -n "$first" ] || first=$value
    [ "$value" = "$first" ] || differs=1
  done
  if [ "$differs" = 1 ]; then
    echo "::error::The $what differs between files:"
    printf '%s' "$report"
    status=1
  fi
}

same 'plugin name' \
  plugin.json:.name \
  .claude-plugin/plugin.json:.name \
  .antigravity-plugin/plugin.json:.name \
  gemini-extension.json:.name \
  '.claude-plugin/marketplace.json:.plugins[0].name' \
  '.agents/plugins/marketplace.json:.plugins[0].name' \
  '.cursor-plugin/marketplace.json:.plugins[0].name'

same 'marketplace name' \
  .claude-plugin/marketplace.json:.name \
  .agents/plugins/marketplace.json:.name \
  .cursor-plugin/marketplace.json:.name

same version \
  plugin.json:.version \
  .claude-plugin/plugin.json:.version \
  .antigravity-plugin/plugin.json:.version \
  gemini-extension.json:.version

same description \
  plugin.json:.description \
  .claude-plugin/plugin.json:.description \
  .antigravity-plugin/plugin.json:.description \
  gemini-extension.json:.description \
  '.claude-plugin/marketplace.json:.plugins[0].description' \
  '.cursor-plugin/marketplace.json:.plugins[0].description'

same 'server URL' \
  .mcp.json:.mcpServers.ether.url \
  mcp.json:.mcpServers.ether.url \
  mcp_config.json:.mcpServers.ether.serverUrl \
  gemini-extension.json:.mcpServers.ether.httpUrl

exit $status
