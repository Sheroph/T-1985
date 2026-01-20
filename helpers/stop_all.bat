@echo off

cd ..\

echo "Stopping all services related to T-1985..."
docker compose stop
echo "All system powered off."
pause