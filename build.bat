@echo off
setlocal enabledelayedexpansion

python sheetable.py https://docs.google.com/spreadsheets/d/e/2PACX-1vTtn0gDzr-kM-NwW9G60kFBv-EP_k8IxHIrYs6bVIyvNNCxdxHqaZi6rnmAX4cIdyIH9lPEOFU6FA3k/pub?output=csv -o templates/timeline.html
for %%f in (*.html) do (
	echo Processing file: %%f
	python genify.py -i %%f -t templates/footer.html -t templates/header.html -t templates/timeline.html -t templates/meta.html
)

endlocal
pause
