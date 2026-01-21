@echo off


call ..\..\helpers\start_docker_desktop.bat
IF ERRORLEVEL 1 (
    exit /b 1
)

echo "Calibrating Skynet's VoidGen..."

docker compose build voidgen
IF %ERRORLEVEL% EQU 0 (
echo "Skynet's VoidGen fully operational"
)
