#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input.html"
    exit 1
fi

input_file="$1"
output_file="${input_file%.html}_formatted.html"

awk 'BEGIN { RS=">"; ORS=">\n" } { gsub(/[[:space:]]+/, " "); print $0 }' "$input_file" > "$output_file"

echo "Formatted HTML saved to: $output_file"
