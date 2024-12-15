#! /usr/bin/env zsh

if [ $# -ne 3 ]; then
  echo "Usage: $0 <directory> <image_width> <name_prefix>"
  exit 1
fi

DIR="$1"

# Convert to absolute path if necessary
if [[ "$DIR" != /* ]]; then
  DIR="$(pwd)/$DIR"
fi

IMAGE_WIDTH="$2"
NAME_PREFIX="$3"

echo "Directory: $DIR"
echo "Image Width: $IMAGE_WIDTH"
echo "Name Prefix: $NAME_PREFIX"


