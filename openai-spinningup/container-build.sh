#!/usr/bin/env bash
set -xeu

cd $(dirname "$0")/..

IMAGE_BASE="ubuntu:16.04"
IMAGE_TAG="spinningup:master"
CONTAINER_NAME="spinningup"

if [ ! -z "$(docker ps -q -a -f name=$CONTAINER_NAME$)" ]; then
    docker rm -f $CONTAINER_NAME
fi

docker pull $IMAGE_BASE

docker build \
    --build-arg baseimage=$IMAGE_BASE \
    -t $IMAGE_TAG \
    -f openai-spinningup/Dockerfile \
    .

docker create \
    --name $CONTAINER_NAME \
    -t \
    -p 8888:8888 \
    -p 6080:6080 \
    $IMAGE_TAG
