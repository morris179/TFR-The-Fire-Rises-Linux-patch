#!/usr/bin/env bash

TARGET_DIR="$HOME/.local/share/Steam/steamapps/workshop/content/394360/3350890356"

echo "[*] Entering directory..."
cd "$TARGET_DIR" || {
  echo "Directory not found!"
  exit 1
}

echo "[*] Renaming Leaders folder if necessary..."
if [ -d "gfx/Leaders" ]; then
  mv "gfx/Leaders" "gfx/leaders"
  echo "  Renamed gfx/Leaders -> gfx/leaders"
fi

echo "[*] Fixing .PNG extensions..."

find . -type f -name "*.PNG" | while read -r file; do
  newname="${file%.PNG}.png"

  echo "  Renaming: $file -> $newname"
  mv "$file" "$newname"
done

echo "[*] Done."
