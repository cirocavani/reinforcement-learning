#!/usr/bin/env bash
set -xeu

cd $(dirname "$0")/..

HW_PLATFORM=${1:-cpu}

case $HW_PLATFORM in
    cpu)
        IMAGE_BASE="ubuntu:16.04"
        DOCKER_RUNTIME=""
        ;;
    gpu)
        IMAGE_BASE="nvidia/cuda:10.0-cudnn7-runtime-ubuntu16.04"
        DOCKER_RUNTIME="--runtime=nvidia"
        ;;
    *)
        echo "Unsupported platform: $HW_PLATFORM"
        exit 1
esac

ENVIRONMENT_FILE="tensorflow-agents/environment-${HW_PLATFORM}.yaml"
IMAGE_TAG="tf-agents-${HW_PLATFORM}:master"
CONTAINER_NAME="tf-agents-${HW_PLATFORM}"

if [ ! -z "$(docker ps -q -a -f name=$CONTAINER_NAME$)" ]; then
    docker rm -f $CONTAINER_NAME
fi

docker pull $IMAGE_BASE

docker build \
    --build-arg baseimage=$IMAGE_BASE \
    --build-arg condaenv=$ENVIRONMENT_FILE \
    -t $IMAGE_TAG \
    -f tensorflow-agents/Dockerfile \
    .

docker create \
    --name $CONTAINER_NAME \
    $DOCKER_RUNTIME \
    -t \
    -p 8888:8888 \
    $IMAGE_TAG
