#!/usr/bin/env zsh

hdiutil create -ov -format UDBZ -imagekey bzip2-level=9 \
  -volname "$(basename "$PWD")" \
  -srcfolder "$PWD" \
  "$(dirname "$PWD")/$(basename "$PWD").dmg"
