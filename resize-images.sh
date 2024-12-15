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
    # Extract the file extension
    extension="${image##*.}"
    
    # Construct the new filename
    new_filename="${NAME_PREFIX}${counter}.${extension}"
    
    # Resize the image
    magick "$image" -resize "${IMAGE_WIDTH}x" "$output_dir/$new_filename"
    
    echo "Resized and renamed $image to $output_dir/$new_filename"
    
    # Increment the counter
    counter=$((counter + 1))
  fi
done
