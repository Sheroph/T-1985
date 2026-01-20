@echo off

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set /a SYSTEM_LAUNCH_TESTED=0

cd ..\
:checkDocker
docker info >nul 2>&1

if ERRORLEVEL 1 (

    IF !SYSTEM_LAUNCH_TESTED! EQU 0 (
        echo "Starting docker..."
        for /f "tokens=4*" %%A in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Docker Desktop"') do (
            set DOCKER_PATH=%%A %%B
        )
        start "" "!DOCKER_PATH!"
    )
    IF !SYSTEM_LAUNCH_TESTED! GTR 5 (
        echo "ERROR: Failed to launch Docker after !SYSTEM_LAUNCH_TESTED! attemps, abort."
        PAUSE
        exit /b 1
    )

    echo "Check if Docker Desktop is running..."

    set /a SYSTEM_LAUNCH_TESTED+=1
    timeout /t 10 >nul
    goto checkDocker
)
endlocal
exit /b 0