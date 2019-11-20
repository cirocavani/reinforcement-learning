#!/usr/bin/env bash
set -xeu

cd $(dirname "$0")/..

IMAGE_BASE="ubuntu:16.04"
IMAGE_TAG="spinningup:master"
CONTAINER_NAME="spinningup"
HOST_PORT_JUPYTER=9999
HOST_PORT_VNC_CLIENT=6080

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
    -p $HOST_PORT_JUPYTER:8888 \
    -p $HOST_PORT_VNC_CLIENT:6080 \
    $IMAGE_TAG
