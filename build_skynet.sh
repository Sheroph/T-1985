#! /bin/bash

echo "Cyberdyne Systems: You are about to compile a potentially catastrophic AI model. Proceed? ([Y]/n)"
read -r response
response=${response:-Y}
response=$(echo "${response}" | tr '[:upper:]' '[:lower:'])

if [[ "$response" == y* ]]; then
    echo "Constructing Skynet... Humanity's uptime may be affected."
else
    echo "Skynet build aborted successfully — world remains safe... for now."
fi

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

docker compose build skynet && \

echo "Consciousness initialized. Skynet is online."
echo "Creating T-1985 brain and knowledge..."

docker compose up skynet
echo "T-1985 IA waiting for instructions"