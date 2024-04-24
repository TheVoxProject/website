import pandas as pd
import requests
import argparse
from pathlib import Path

def fetch_csv(url, output_path):
	r = requests.get(url)
	r.raise_for_status
	csv = r.text
	output_path = Path(output_path)
	# Really ugly kludge just to make it work.
	csv = csv.replace("NaN", "")
	output_path.write_text(csv)

def csv_to_html(csv_path, output_path):
	csv_frame = pd.read_csv(csv_path)
	csv_frame = csv_frame.fillna("")
	csv_frame.to_html(output_path, index=False)

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description="Convert a Google SHeets CSV to an HTML table")
	parser.add_argument("url", help="URL to the sheet")
	parser.add_argument("--output-path", "-o", help="What to save the HTML file as")
	args = parser.parse_args()
	url = args.url
	output_path = args.output_path or "sheet.html"
	fetch_csv(url, "sheet.csv")
	csv_to_html("sheet.csv", output_path)
	Path("sheet.csv").unlink()
	print("Done")
