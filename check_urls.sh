#!/bin/bash

# Check if both files are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 file1.txt file2.txt"
    exit 1
fi

# Assign file names to variables
file1="$1"
file2="$2"

# Check if files exist
if [ ! -f "$file1" ]; then
    echo "Error: $file1 not found."
    exit 1
fi

if [ ! -f "$file2" ]; then
    echo "Error: $file2 not found."
    exit 1
fi

# Extract URLs from file1 and handle trailing ) if present
urls=$(grep -Eo 'https?://[^[:space:])]+' "$file1" | sed 's/[)]$//' | sort | uniq)

# Check each URL against file2 and list the missing ones
missing_urls=()

while IFS= read -r url; do
    # Check if the URL exists in file2
    if ! grep -qF "$url" "$file2"; then
        missing_urls+=("$url")
    fi
done <<< "$urls"

# Output results
if [ ${#missing_urls[@]} -eq 0 ]; then
    echo "All URLs from $file1 are present in $file2."
else
    echo "The following URLs from $file1 are missing in $file2:"
    for url in "${missing_urls[@]}"; do
        echo "$url"
    done
fi
