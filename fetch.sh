#!/usr/bin/env bash
# Downloads Telegram MTProxy config files for regions where core.telegram.org is blocked.
set -euo pipefail

DEST_DIR="${1:-.}"
mkdir -p "$DEST_DIR"

echo "Downloading Telegram proxy config files..."

curl -fsSL --connect-timeout 30 --max-time 60 \
  "https://core.telegram.org/getProxySecret" \
  -o "${DEST_DIR}/proxy-secret"
echo "  proxy-secret: $(wc -c < "${DEST_DIR}/proxy-secret") bytes"

curl -fsSL --connect-timeout 30 --max-time 60 \
  "https://core.telegram.org/getProxyConfig" \
  -o "${DEST_DIR}/proxy-config"
echo "  proxy-config: $(wc -c < "${DEST_DIR}/proxy-config") bytes"

curl -fsSL --connect-timeout 30 --max-time 60 \
  "https://core.telegram.org/getProxyConfigV6" \
  -o "${DEST_DIR}/proxy-config-v6"
echo "  proxy-config-v6: $(wc -c < "${DEST_DIR}/proxy-config-v6") bytes"

echo "All files downloaded successfully."
