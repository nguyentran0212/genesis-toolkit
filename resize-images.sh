#! /usr/bin/env zsh

if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

DIR="$1"

# Convert to absolute path if necessary
if [[ "$DIR" != /* ]]; then
  DIR="$(pwd)/$DIR"
fi

echo "Directory: $DIR"


