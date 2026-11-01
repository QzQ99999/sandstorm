@echo off
setlocal EnableExtensions DisableDelayedExpansion
rem Place this launcher beside Sandstorm.html.
rem Sandstorm keeps its own persistent Chrome profile and workbench saves.

set "SCENE=%~dp0Sandstorm.html"
if not exist "%SCENE%" goto missing_scene

set "CHROME="
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if defined CHROME goto browser_found
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if defined CHROME goto browser_found
if exist "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" set "CHROME=%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe"
if not defined CHROME goto missing_chrome

:browser_found
if not defined LOCALAPPDATA goto missing_localappdata
set "PROFILE=%LOCALAPPDATA%\Afterimage\Sandstorm\ChromeProfile"
if not exist "%PROFILE%\" mkdir "%PROFILE%"
if not exist "%PROFILE%\" goto profile_failed

start "Sandstorm" "%CHROME%" --user-data-dir="%PROFILE%" --force-high-performance-gpu --use-webgpu-power-preference=default-high-performance --no-first-run --no-default-browser-check --new-window "%SCENE%"
if errorlevel 1 goto launch_failed
exit /b 0

:missing_scene
echo Sandstorm.html was not found beside this launcher:
echo "%SCENE%"
echo Move this launcher beside Sandstorm.html, then try again.
goto failed

:missing_chrome
echo Google Chrome was not found in its standard installation locations.
echo This launcher does not download or install software.
goto failed

:missing_localappdata
echo LOCALAPPDATA is unavailable. A separate Chrome profile cannot be created.
goto failed

:profile_failed
echo The separate Chrome profile folder could not be created:
echo "%PROFILE%"
goto failed

:launch_failed
echo Google Chrome could not be started.

:failed
echo.
pause
exit /b 1
