@echo off


echo "Calibrating Skynet's VoidGen..."

docker compose build voidgen
IF %ERRORLEVEL% EQU 0 (
echo "Skynet's VoidGen fully operational"
)
