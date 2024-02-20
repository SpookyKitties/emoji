#!/bin/zsh

# Directories
SOURCE_DIR="./tiff"
OUTPUT_DIR="./png"

# Create the output directory if it doesn't exist
if [[ ! -d "$OUTPUT_DIR" ]]; then
    mkdir "$OUTPUT_DIR"
fi

# Loop through all TIFF images in the source directory
for img in "$SOURCE_DIR"/*.tiff; do
    # Get the base filename without the directory and extension
    filename=$(basename "$img" .tiff)

    # Specify the output filename
    output="$OUTPUT_DIR/${filename}.png"

    # Convert and resize using ImageMagick
    convert "$img" -resize 512x512 "$output"

    echo "Converted and resized $img to $output"
done
