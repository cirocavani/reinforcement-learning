#!/usr/bin/env bash
set +xeu

. activate spinningup

python -m spinup.run ppo --hid "[32,32]" --env LunarLander-v2 --exp_name installtest --gamma 0.999 --data_dir ~/data
