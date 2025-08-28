#!/bin/bash

# Script to update files.json with all .txt files in data/ directory

echo "Updating files.json..."

# Create data directory if it doesn't exist
mkdir -p data

# Generate JSON with all .txt files in data/ directory
echo '{' > data/files.json
echo '  "files": [' >> data/files.json

# Find all .txt files and format them as JSON array
first_file=true
for file in data/*.txt; do
    # Check if any .txt files exist
    if [ -f "$file" ]; then
        # Extract just the filename without the path
        filename=$(basename "$file")
        
        # Add comma before each entry except the first
        if [ "$first_file" = true ]; then
            echo "    \"$filename\"" >> data/files.json
            first_file=false
        else
            echo ",    \"$filename\"" >> data/files.json
        fi
    fi
done

echo '  ]' >> data/files.json
echo '}' >> data/files.json

# Count files found
file_count=$(ls data/*.txt 2>/dev/null | wc -l)
echo "Found $file_count .txt files in data/ directory"
echo "files.json updated successfully!"

# Display the contents
echo ""
echo "Contents of files.json:"
cat data/files.json
