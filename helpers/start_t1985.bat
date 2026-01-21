@echo off

call .\start_docker_desktop.bat

if ERRORLEVEL 1 (
    exit /b 1
)

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set /a SYSTEM_LAUNCH_TESTED=0

cd ..\

if not exist ".\link-85_data" (
    mkdir ".\link-85_data"
)

if not exist ".\models" (
    mkdir ".\models"
    echo "Models directory created, download one and copy it move into models directory."
    echo "And remember to update your .env file with your model filename ;)"
    echo "Aborting start because there are no models available."
    pause
    exit /b 1
)

docker compose up -d t-1985 continue-proxy
echo "Waiting for services to be operational..."

:waitSystemOperational
timeout /t 10 >nul
curl -f http://localhost:8001/health >nul
if ERRORLEVEL 1 (
    if !SYSTEM_LAUNCH_TESTED! GTR 5 (
        echo "ERROR: Failed to start T-1985, abort."
        exit /b 1
    )
    set /a SYSTEM_LAUNCH_TESTED+=1
    goto waitSystemOperational
)
echo "T-1985 operational."
endlocal
PAUSE