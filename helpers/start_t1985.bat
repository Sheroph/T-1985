@echo off

call .\start_docker_desktop.bat

if ERRORLEVEL 1 (
    exit /b 1
)

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set /a SYSTEM_LAUNCH_TESTED=0

cd ..\

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