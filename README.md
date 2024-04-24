# CalcVox Website
Website for the CalcVox project.

## Note.
All HTML content is rendered from the root of this repository, using build.bat and [Genify](https://www.github.com/calcvox/genify). As such, never modify the content in the dist folder directly, always modify the HTML in the root then run build.bat.

The HTML is the only thing that gets processed so far though, so everything else can go in the dist folder, which is what gets served to Cloudflare.

To make build.bat work, you can either add Genify to path, or toss it in the root of this repository, and have a Python with the requirements installed globally in your PATH. Genify.py is gitignored, so don't worry about cluttering the repo.
