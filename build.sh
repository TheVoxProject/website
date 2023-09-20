#!/bin/bash

# Enable delayed expansion
set -e

# Define the URL and output directory
URL="https://docs.google.com/spreadsheets/d/e/2PACX-1vTtn0gDzr-kM-NwW9G60kFBv-EP_k8IxHIrYs6bVIyvNNCxdxHqaZi6rnmAX4cIdyIH9lPEOFU6FA3k/pub?output=csv"
OUTPUT_DIR="templates/"

# Download the CSV file using sheetable.py
python3 sheetable.py "$URL" -o "${OUTPUT_DIR}timeline.html"

# Process the HTML files
for file in *.html; do
    echo "Processing file: $file"
    python3 genify.py -i "$file" -t "${OUTPUT_DIR}footer.html" -t "${OUTPUT_DIR}header.html" -t "${OUTPUT_DIR}timeline.html"
done

# Pause (optional)
read -p "Press Enter to continue..."
