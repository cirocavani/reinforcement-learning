#!/usr/bin/env bash
set -xeu

cd $(dirname "$0")/../downloads

# Conda

CONDA_PKG=Miniconda3-4.6.14-Linux-x86_64.sh
CONDA_URL=https://repo.continuum.io/miniconda/$CONDA_PKG

if [ ! -f $CONDA_PKG ]; then
    curl -k -L -o $CONDA_PKG $CONDA_URL
fi

# VNC Client (web)

NOVNC_PKG=novnc-1.1.0.zip
NOVNC_URL=https://github.com/novnc/noVNC/archive/v1.1.0.zip

if [ ! -f $NOVNC_PKG ]; then
    curl -k -L -o $NOVNC_PKG $NOVNC_URL
fi

WEBSOCKIFY_PKG=websockify-0.8.0.zip
WEBSOCKIFY_URL=https://github.com/novnc/websockify/archive/v0.8.0.zip

if [ ! -f $WEBSOCKIFY_PKG ]; then
    curl -k -L -o $WEBSOCKIFY_PKG $WEBSOCKIFY_URL
fi

md5sum --check MD5SUM