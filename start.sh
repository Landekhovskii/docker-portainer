#!/bin/bash

DOCKER_PATH=$(which docker)
COMPOSE_PATH=$(which compose)

if [[ -z "$DOCKER_PATH" ]]
then
  echo "Docker not found!"
  exit 1
fi

if [[ -z "$COMPOSE_PATH" ]]
then
  echo "Compose plugin not found!"
  exit 1
fi

if [[ -z "$1" ]]
then
  echo "Project name is empty!"
  exit 1
fi

if [[ "$2" != "up" && "$2" != "down" ]]
then
  echo "Action must be up or down!"
  exit 1
fi

PROJECT="$1" docker compose -p "$1" "$2" "$3"

exit 0
