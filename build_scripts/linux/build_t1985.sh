#! /bin/bash

# At first build llama.cpp and generate related debian package using dedicated container
./build_skynet.sh
./build_redeye.sh

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

# Build t-1985 docker image
echo "Reprogramming T-1985 brain..."
docker compose build t-1985 && echo "t-1985 cyborg ready to help you"
