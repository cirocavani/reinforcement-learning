#!/usr/bin/env bash
set -eu

cd $HOME

export SHELL=/bin/bash

~/conda/envs/jupyter/bin/jupyter notebook
