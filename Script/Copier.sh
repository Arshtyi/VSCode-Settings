#!/bin/bash

# 源目录
SOURCE_DIR="/home/arshtyi/.config/Code/User"

# 目标目录（脚本所在目录的上一级）
DEST_DIR="$(dirname "$0")/.."

# 确保目标目录存在
mkdir -p "$DEST_DIR"

# 要复制的文件和文件夹
FILES_TO_COPY=("settings.json" "keybindings.json")
FOLDER_TO_COPY="snippets"

# 复制文件
for file in "${FILES_TO_COPY[@]}"; do
  SOURCE_FILE="$SOURCE_DIR/$file"
  if [ -f "$SOURCE_FILE" ]; then
    cp "$SOURCE_FILE" "$DEST_DIR/"
    echo "已复制 $file 到 $DEST_DIR/"
  else
    echo "警告: $SOURCE_FILE 不存在，跳过复制。"
  fi
done

# 复制文件夹
SOURCE_FOLDER="$SOURCE_DIR/$FOLDER_TO_COPY"
if [ -d "$SOURCE_FOLDER" ]; then
  cp -r "$SOURCE_FOLDER" "$DEST_DIR/"
  echo "已复制 $FOLDER_TO_COPY 文件夹到 $DEST_DIR/"
else
  echo "警告: $SOURCE_FOLDER 不存在，跳过复制。"
fi

echo "复制完成。"
