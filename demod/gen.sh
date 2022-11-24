#!/usr/bin/env bash

set -e

SAMP_RATE=1920000

grcc ask.grc
python3 ask.py --samp-rate=${SAMP_RATE} --offset=0

grcc fsk.grc
python3 fsk.py --samp-rate=${SAMP_RATE} --offset=100000

grcc psk.grc
python3 psk.py --samp-rate=${SAMP_RATE} --offset=-100000
