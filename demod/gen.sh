#!/usr/bin/env bash

set -e

SAMP_RATE=5760000

grcc ask.grc
python3 ask.py --samp-rate=${SAMP_RATE} --offset=500000

grcc fsk.grc
python3 fsk.py --samp-rate=${SAMP_RATE} --offset=700000

grcc psk.grc
python3 psk.py --samp-rate=${SAMP_RATE} --offset=300000
