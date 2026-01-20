#! /bin/bash


export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

# Build voidgen docker image
echo "Calibrating Synet's VoidGen..."
docker compose build voidgen && echo "Skynet's VoidGen fully operational"
