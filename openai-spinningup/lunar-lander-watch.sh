#!/usr/bin/env bash
set +xeu

. activate spinningup

python -m spinup.run test_policy ~/data/installtest/installtest_s0
