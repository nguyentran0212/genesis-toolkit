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

# Create a subdirectory for resized images
output_dir="$DIR/resized"
mkdir -p "$output_dir"

counter=1

for image in "$DIR"/*; do
  if [[ -f "$image" && "$image" =~ \.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$ ]]; then
  if [ -f "$image" ]; then
    # Extract the file extension
    extension="${image##*.}"
    
    # Construct the new filename
    new_filename="${NAME_PREFIX}${counter}.${extension}"
    
    # Resize the image
    convert "$image" -resize "${IMAGE_WIDTH}" "$output_dir/$new_filename"
    
    echo "Resized and renamed $image to $new_filename"
    
    # Increment the counter
    counter=$((counter + 1))
  fi
  done
done


