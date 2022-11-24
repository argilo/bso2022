#!/usr/bin/env bash

set -e

SAMP_RATE=5760000

python3 gen_flags.py

grcc lo1.grc
python3 lo1.py --samp-rate=${SAMP_RATE} --offset=-1500000

grcc lo2.grc
python3 lo2.py --samp-rate=${SAMP_RATE} --offset=1500000
