#!/bin/bash

docker stop $(docker ps -q)
docker compose -f docker-compose.yml up
