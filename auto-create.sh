#!/bin/bash

# Script to generate a docker-compose.yml file with multiple containers

# Parameters
SERVICE_NAME="nexus-xyz-cli"
BASE_PROVER_ID="null"
NUM_CONTAINERS=$1 # Pass the number of containers as the first argument

# Check if the number of containers is provided
if [ -z "$NUM_CONTAINERS" ]; then
  echo "Usage: $0 <number_of_containers>"
  exit 1
fi

# Create the docker-compose.yml file
echo "version: '3.9'" > docker-compose.yml
echo "services:" >> docker-compose.yml

# Loop to create container entries
for ((i=1; i<=NUM_CONTAINERS; i++))
do
  CONTAINER_NAME="${SERVICE_NAME}-${i}"

  cat <<EOL >> docker-compose.yml
  ${CONTAINER_NAME}:
    container_name: ${CONTAINER_NAME}
    build: .
    restart: unless-stopped
    stop_grace_period: 5m
    environment:
      - PROVER_ID=${BASE_PROVER_ID}

EOL
done

echo "docker-compose.yml has been generated with ${NUM_CONTAINERS} containers."