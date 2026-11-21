#!/bin/bash
# Double-click to open IEM Fiber Link Budget in your default web browser.
# Works from the downloaded folder, the installed copy, or the Desktop launcher.
SRC="$0"
[ -L "$SRC" ] && SRC="$(readlink "$SRC")"   # the Desktop launcher is a link to this script
DIR="$(cd "$(dirname "$SRC")" && pwd)"
if [ ! -f "$DIR/index.html" ]; then
  echo "Can't find index.html next to this script ($DIR)."
  read -n 1 -s -r -p "Press any key to close."
  exit 1
fi
open "$DIR/index.html"
