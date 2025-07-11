#! /bin/bash

# At first build llama.cpp and generate related debian package using dedicated container
echo "Build llama.cpp package ..."
docker compose up --build t-1985-factory
# Build t-1985 docker image
echo "Build t-1985 image ..."
docker compose build t-1985
echo "t-1985 image ready to help you"
