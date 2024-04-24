import argparse
from pathlib import Path
from jinja2 import Environment, FileSystemLoader

def render_html(filename, templates):
	env = Environment(loader=FileSystemLoader(filename.parent))
	template = env.get_template(filename.name)
	context = {}
	for template_path in templates:
		template_name = template_path.name
		with open(template_path, "r") as template_file:
			context[template_name] = template_file.read()
	rendered_html = template.render(context)
	with open(Path("dist") / filename, "w") as output_file:
		output_file.write(rendered_html)

def main():
	Path("dist").mkdir(exist_ok=True)
	parser = argparse.ArgumentParser(description="Render HTML templates using Jinja2")
	parser.add_argument("-i", "--input", required=True, type=Path, help="Input HTML file")
	parser.add_argument("-t", "--template", action="append", required=True, type=Path, help="Template files to include")
	args = parser.parse_args()
	input_path = args.input
	template_paths = args.template
	render_html(input_path, template_paths)
	print(f"Rendered {input_path}")

if __name__ == "__main__":
	main()
