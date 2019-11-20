#!/usr/bin/env bash
set +xeu

source ~/conda/etc/profile.d/conda.sh

conda activate spinningup

python \
    -m spinup.run \
    test_policy \
    ~/data/LunarLander-v2-PPO/LunarLander-v2-PPO_s0
