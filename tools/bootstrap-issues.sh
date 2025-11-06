#!/usr/bin/env bash
set -euo pipefail

# Requires: gh (GitHub CLI), jq
#   brew install gh jq    OR    sudo apt-get install gh jq
# Login first: gh auth login

ROADMAP_FILE="ROADMAP.md" 
LABEL="phase2"
REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"

declare -A ITEMS=(
  [issue-mmwave-params]="LD2410C: expose configurable radar parameters (sensitivity, gates)"
  [issue-mmwave-config-service]="LD2410C: service to enter/exit config mode from Home Assistant"
  [issue-mmwave-false-positives]="LD2410C: optional filtering for short false positives"
  [issue-mmwave-logging]="LD2410C: detailed logging of moving vs still targets"
  [issue-mmwave-confidence]="LD2410C: explore confidence metric as custom sensor"
  [issue-true-presence]="Presence: template binary sensor for True Presence (LD2410 OR AS312)"
  [issue-pir-delay-off]="Presence: PIR delay-off to prevent flicker"
  [issue-mmwave-linger]="Presence: mmWave linger time"
  [issue-presence-timeout-number]="Presence: adjustable timeout via HA number entity"
  [issue-veml7700-auto-gain]="VEML7700: auto gain/integration switching"
  [issue-brightness-level]="VEML7700: brightness level sensor (dark/dim/bright)"
  [issue-auto-light-trigger]="VEML7700: optional auto-light trigger output"
  [issue-esp-temp]="Diagnostics: ESP temperature sensor"
  [issue-free-mem]="Diagnostics: free memory sensor"
  [issue-version-text-sensors]="Diagnostics: firmware/build/release tag text sensors"
  [issue-board-info]="Diagnostics: board info text (model + firmware + build)"
  [issue-update-button]="Updates: manual Check for Updates button"
  [issue-semver-compare]="Updates: semantic version comparison"
  [issue-ha-persistent-notice]="Updates: persistent HA notification on new release"
  [issue-auto-update-flag]="Updates: optional auto-update flag (off by default)"
  [issue-web-dashboard]="Web UI: dashboard at / with live readings"
  [issue-web-dashboard-stats]="Web UI: show firmware, uptime, Wi-Fi strength"
  [issue-status-json]="/status.json diagnostics endpoint"
  [issue-power-measure]="Power: measure idle draw and document targets"
  [issue-light-sleep]="Power: light sleep when idle (optional)"
  [issue-deep-sleep]="Power: deep sleep template for future battery variant"
  [issue-startup-current]="Power: document startup current and timing"
  [issue-bme280]="Expansion: optional BME280 (T/H/P)"
  [issue-sgpxx]="Expansion: optional SGP30/SGP40 (air quality)"
  [issue-rgb-led]="Expansion: RGB status LED (booting/connected/update)"
  [issue-longpress-reset]="Expansion: long-press safe-mode/Wi-Fi reset"
  [issue-self-test]="Expansion: device self-test mode (boot button hold)"
)

# Ensure label exists
if ! gh label view "$LABEL" >/dev/null 2>&1; then
  gh label create "$LABEL" --color '#0E8A16' --description "Phase 2 roadmap"
fi

# Create issues and collect URLs
declare -A URLS=()
for key in "${!ITEMS[@]}"; do
  title="${ITEMS[$key]}"
  url="$(gh issue create --title "$title" --label "$LABEL" --body "Auto-created from Phase 2 roadmap." --repo "$REPO" --json url -q .url)"
  URLS["$key"]="$url"
  echo "Created: $title -> $url"
done

# Rewrite ROADMAP file: replace (#issue-...) anchors with actual issue URLs
TMP="$(mktemp)"
cp "$ROADMAP_FILE" "$TMP"
for key in "${!URLS[@]}"; do
  url="${URLS[$key]}"
  # Replace markdown links that use (#issue-...) with (actual-url)
  sed -i.bak -E "s|\(#${key}\)|(${url})|g" "$TMP"
done

mv "$TMP" "$ROADMAP_FILE"
rm -f "${TMP}.bak"

echo "Updated $ROADMAP_FILE with live issue links."
