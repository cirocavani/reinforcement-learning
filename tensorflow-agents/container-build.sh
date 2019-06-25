#!/usr/bin/env bash
set -xeu

cd $(dirname "$0")/..

IMAGE_TAG="tf-agents:master"
CONTAINER_NAME="tf-agents"

if [ ! -z "$(docker ps -q -a -f name=$CONTAINER_NAME$)" ]; then
    docker rm -f $CONTAINER_NAME
fi

docker pull ubuntu:16.04

docker build \
    -t $IMAGE_TAG \
    -f tensorflow-agents/Dockerfile \
    .

docker create \
    --name $CONTAINER_NAME \
    -t \
    -p 8888:8888 \
    $IMAGE_TAG
