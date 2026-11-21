#!/bin/bash
# Double-click to install IEM Fiber Link Budget on this Mac.
# Copies the app to ~/Applications/IEM Fiber Link Budget and puts a launcher on the Desktop.
# Nothing else is needed: the app runs in your web browser and works offline.
set -e
cd "$(dirname "$0")"

DEST="$HOME/Applications/IEM Fiber Link Budget"
LAUNCHER="$HOME/Desktop/IEM Fiber Link Budget.command"

echo "Installing IEM Fiber Link Budget to:"
echo "  $DEST"
mkdir -p "$DEST"
cp index.html run-mac.command README.md "$DEST/"
chmod +x "$DEST/run-mac.command"
# files downloaded from the internet are flagged by macOS; clear that so the launcher opens without a warning
xattr -dr com.apple.quarantine "$DEST" 2>/dev/null || true

ln -sf "$DEST/run-mac.command" "$LAUNCHER"
echo "Desktop launcher: IEM Fiber Link Budget.command"
echo
echo "Done. Double-click the Desktop launcher (or run-mac.command) to open the app."
read -n 1 -s -r -p "Press any key to close."
echo
