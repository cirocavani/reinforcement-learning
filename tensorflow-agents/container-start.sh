#!/usr/bin/env bash
set -xeu

cd $(dirname "$0")/..

docker start tf-agents
