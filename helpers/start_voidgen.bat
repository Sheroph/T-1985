@echo off

call .\start_docker_desktop.bat

if ERRORLEVEL 1 (
    exit /b 1
)

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

cd ..\

if not exist "voidgen_data" (
    mkdir "voidgen_data"
)
if not exist "voidgen_data\user" (
    mkdir "voidgen_data\user"
)
if not exist "voidgen_data\input" (
    mkdir "voidgen_data\input"
)


docker compose up -d voidgen
echo "Waiting for services to be operational..."

set /a SYSTEM_LAUNCH_TESTED=0

:waitSystemOperational
timeout /t 10 >nul
curl -f http://localhost:8002/features >nul
if ERRORLEVEL 1 (
    if !SYSTEM_LAUNCH_TESTED! GTR 5 (
        echo "ERROR: Failed to start VoidGen, abort."
        exit /b 1
    )
    set /a SYSTEM_LAUNCH_TESTED+=1
    goto waitSystemOperational
)
echo "VoidGen operational."
PAUSE