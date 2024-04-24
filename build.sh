#!/bin/bash

set -e
URL="https://docs.google.com/spreadsheets/d/e/2PACX-1vTtn0gDzr-kM-NwW9G60kFBv-EP_k8IxHIrYs6bVIyvNNCxdxHqaZi6rnmAX4cIdyIH9lPEOFU6FA3k/pub?output=csv"
OUTPUT_DIR="templates/"
python3 sheetable.py "$URL" -o "${OUTPUT_DIR}timeline.html"
for file in *.html; do
	echo "Processing file: $file"
	python3 genify.py -i "$file" -t "${OUTPUT_DIR}footer.html" -t "${OUTPUT_DIR}header.html" -t "${OUTPUT_DIR}timeline.html" -t "${OUTPUT_DIR}meta.html"
done
# read -p "Press Enter to continue..."
