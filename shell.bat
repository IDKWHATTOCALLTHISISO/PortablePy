@echo off
setlocal enabledelayedexpansion

cd python
for /f "delims=" %%i in ('whoami') do set USER=%%i
goto help-page

:loop
for /f "delims=" %%i in ('cd') do set WD=%%i
set /p command="!USER!@!WD!: "
if "!command!"=="" goto loop
if "!command!"=="?" goto help-page
if "!command!"=="exit" exit /b
if "!command:~0,6!"=="python" goto disabled
if "!command:~0,3!"=="pip" goto disabled
!command!
pause
goto loop

:help-page
echo Use .\ if you want to run a command from the current directory
echo Use the command exit to return to cmd
echo run the command ? for help
echo For nano run ..\nano\nano
goto pyhelp

:disabled
echo Python and pip commands are disabled in this shell.
goto pyhelp

:pyhelp
echo Pip is located at .\Scripts\pip and Python is at .\python
goto loop
