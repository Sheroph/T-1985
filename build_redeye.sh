#! /bin/bash


export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

# Build redeye docker image
echo "Calibrating Synet's RedEye..."
docker compose build redeye && echo "Skynet's RedEye fully operational"
