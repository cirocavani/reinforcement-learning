#!/usr/bin/env bash
set -eu

cd $HOME

source ~/conda/etc/profile.d/conda.sh

conda activate jupyter

export SHELL=/bin/bash

jupyter lab
