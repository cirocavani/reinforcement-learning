#!/usr/bin/env bash
set -xeu

cd $(dirname "$0")/..

docker pull ubuntu:16.04

docker build \
    -t spinningup:master \
    -f openai-spinningup/Dockerfile \
    .

docker create \
    --name spinningup \
    -t \
    -p 8888:8888 \
    -p 6080:6080 \
    spinningup:master
