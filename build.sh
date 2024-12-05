#!/bin/bash

docker stop $(docker ps -q)
docker rmi -f simulator-f1tenth:latest
docker compose -f docker-compose.yml up
