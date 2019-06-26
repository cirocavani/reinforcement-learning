#!/usr/bin/env bash
set -xeu

cd $(dirname "$0")/..

HW_PLATFORM=${1:-cpu}

case $HW_PLATFORM in
    cpu)
        ;;
    gpu)
        ;;
    *)
        echo "Unsupported platform: $HW_PLATFORM"
        exit 1
esac

docker start tf-agents-${HW_PLATFORM}
