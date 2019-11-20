#!/usr/bin/env bash
set +xeu

source ~/conda/etc/profile.d/conda.sh

conda activate spinningup

python \
    -m spinup.run \
    ppo \
    --hid "[32,32]" \
    --env LunarLander-v2 \
    --exp_name LunarLander-v2-PPO \
    --gamma 0.999 \
    --data_dir ~/data
