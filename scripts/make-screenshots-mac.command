#!/bin/bash
# Regenerate the README screenshots in docs/screenshots. Needs Firefox (headless mode).
# Each shot opens index.html#shot=<scene>, which builds a demo design and outlines the
# Fiber Links buttons it is showing off. It never touches designs saved in your browser.
# Shots are in dark mode, like the app on a dark-mode Mac.
set -e
cd "$(dirname "$0")/.."
FF="/Applications/Firefox.app/Contents/MacOS/firefox"
[ -x "$FF" ] || { echo "Firefox not found at $FF"; exit 1; }
PROFILE="$(mktemp -d)"
trap 'rm -rf "$PROFILE"' EXIT
mkdir -p docs/screenshots

shot(){ # scene file size [theme]
  "$FF" --headless --no-remote --profile "$PROFILE" --window-size="$3" \
    --screenshot "$PWD/docs/screenshots/$2.png" "file://$PWD/index.html#shot=$1&theme=${4:-dark}" >/dev/null 2>&1
  echo "  docs/screenshots/$2.png"
}
shot overview            01-overview-apply-attenuation          1440,1400
shot attenuated          02-attenuated-pad-order                1440,1400
shot combiner-overpower  03-combiner-lower-power-or-attenuate   1440,1400
shot combiner-moved-pads 04-combiner-pad-transmitter-outputs    1440,1300
shot ysplit              05-ysplit-hat-a-plus                   1440,1300
shot quick-add           06-quick-add-receiver                  1440,1300
shot mfl                 07-mfl-ttrr-rrtt-mux                   1440,1300
echo "Done."
