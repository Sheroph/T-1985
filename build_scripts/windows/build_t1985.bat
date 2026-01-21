@echo off
setlocal ENABLEEXTENSIONS

REM Start docker desktop if needed

call ..\..\helpers\start_docker_desktop.bat
IF ERRORLEVEL 1 (
    exit /b 1
)

REM At first build llama.cpp and generate related image using dedicated containers
call build_skynet.bat
IF ERRORLEVEL 1 (
echo "build_skynet failed. Aborting."
exit /b 1
)

call build_voidgen.bat
IF ERRORLEVEL 1 (
echo "build_voidgen failed. Aborting."
exit /b 1
)

echo "Reprogramming T-1985 brain..."

docker compose build t-1985
IF ERRORLEVEL 1 (
echo "Failed to build t-1985 image."
exit /b 1
)

echo "t-1985 cyborg ready to help you"

endlocal
