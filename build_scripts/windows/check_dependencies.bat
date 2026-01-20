@echo off

REM Test WSL
wsl --version >nul 2>&1
if ERRORLEVEL 1 (
    echo "ERROR: WSL (Windows Subsystem for Linux) is not installed or not accessible from cmd"
    exit /b 1
)

REM Test Docker
docker --version >nul 2>&1
if ERRORLEVEL 1 (
    echo "ERROR: Docker is not installed or not accessible from cmd"
    exit /b 1
)

REM Test Docker compose
docker compose --version >nul 2>&1
if ERRORLEVEL 1 (
    echo "ERROR: Docker compose is not installed or not accessible from cmd"
    exit /b 1
)

echo "All requirements are satisfied."
pause