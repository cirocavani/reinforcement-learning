#!/usr/bin/env bash
set -xeu

cd $(dirname "$0")/..

docker stop tf-agents
