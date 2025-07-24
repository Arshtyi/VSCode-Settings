#!/bin/bash
SOURCE_DIR="/home/arshtyi/.config/Code/User"
DEST_DIR="$(dirname "$0")/.."
FILES_TO_COPY=("settings.json" "keybindings.json")
FOLDER_TO_COPY="snippets"
for file in "${FILES_TO_COPY[@]}"; do
  SOURCE_FILE="$SOURCE_DIR/$file"
  if [ -f "$SOURCE_FILE" ]; then
    cp "$SOURCE_FILE" "$DEST_DIR/"
    echo "已复制 $file 到 $DEST_DIR/"
  else
    echo "警告: $SOURCE_FILE 不存在，跳过复制。"
  fi
done
SOURCE_FOLDER="$SOURCE_DIR/$FOLDER_TO_COPY"
if [ -d "$SOURCE_FOLDER" ]; then
  cp -r "$SOURCE_FOLDER" "$DEST_DIR/"
  echo "已复制 $FOLDER_TO_COPY 文件夹到 $DEST_DIR/"
else
  echo "警告: $SOURCE_FOLDER 不存在，跳过复制。"
fi
echo "复制完成。"
