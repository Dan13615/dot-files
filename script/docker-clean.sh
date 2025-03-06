#!/bin/bash

# Stop and remove all running containers
echo "Stopping all running containers..."
docker stop $(docker ps -aq)

echo "Removing all containers..."
docker rm $(docker ps -aq)

# Remove all dangling images
echo "Removing dangling images..."
docker rmi $(docker images -f "dangling=true" -q)

# Remove all unused images
echo "Removing unused images..."
docker image prune -a -f

# Remove all unused volumes
echo "Removing unused volumes..."
docker volume prune -f

# Remove all unused networks
echo "Removing unused networks..."
docker network prune -f

# Remove all build cache
echo "Removing Docker build cache..."
docker builder prune -f

echo "Docker cleanup complete!"
