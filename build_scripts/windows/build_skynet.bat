@echo off
setlocal ENABLEEXTENSIONS

echo "Cyberdyne Systems: You are about to compile a potentially catastrophic AI model. Proceed? ([Y]/n)"
set /p response=

REM Default = Y
if "%response%"=="" set response=Y

REM Take first character only
set response=%response:~0,1%

REM Case-insensitive compare
if /I NOT "%response%"=="Y" (
echo "Skynet build aborted successfully — world remains safe... for now."
exit /b 0
)

echo "Constructing Skynet... Humanity's uptime may be affected."

REM Rely on Dockerfile default UID/GID (1000:1000)

docker compose build skynet
IF ERRORLEVEL 1 (
echo "Skynet build failed. Judgment Day postponed."
exit /b 1
)

echo "Consciousness initialized. Skynet is online."
echo "Creating T-1985 brain and knowledge..."

docker compose up skynet

echo "T-1985 IA waiting for instructions"
endlocal
