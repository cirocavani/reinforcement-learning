#!/usr/bin/env bash
set -eu

cd $HOME

source ~/conda/etc/profile.d/conda.sh

conda activate x

VNC_HOST=localhost
VNC_PORT=5900

Xvfb $DISPLAY -screen 0 800x600x24 > ~/logs/xvfb.log 2>&1 &
fluxbox > ~/logs/fluxbox.log 2>&1 &
x11vnc -forever -display $DISPLAY -bg -nopw -listen $VNC_HOST -rfbport $VNC_PORT -xkb > ~/logs/x11vnc.log 2>&1 &
~/libs/noVNC-1.1.0/utils/launch.sh --vnc $VNC_HOST:$VNC_PORT > ~/logs/novnc.log 2>&1 &
