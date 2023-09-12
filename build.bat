@echo off
setlocal enabledelayedexpansion

for %%f in (*.html) do (
	echo Processing file: %%f
	python genify.py -i %%f -t templates/footer.html -t templates/header.html
)

endlocal
pause
