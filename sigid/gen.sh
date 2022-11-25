#!/usr/bin/env bash

set -e

SAMP_RATE=7680000

python3 gen_flags.py

# Paint
grcc sig1.grc
convert \
  -background White \
  -gravity Center \
  -pointsize 150 \
  label:'Part 1: flag\{b2e2b3877aad4108\}' \
  -rotate 270 \
  -extent x2300 \
  -background Black \
  -extent 256x \
  flag1.png
python3 sig1.py --samp-rate=${SAMP_RATE} --offset=-450000

# NBFM
grcc sig2.grc
python3 sig2.py --samp-rate=${SAMP_RATE} --offset=-250000

# AM
grcc sig3.grc
python3 sig3.py --samp-rate=${SAMP_RATE} --offset=-650000

# LSB
grcc sig4.grc
python3 sig4.py --samp-rate=${SAMP_RATE} --offset=-350000

# USB
grcc sig5.grc
python3 sig5.py --samp-rate=${SAMP_RATE} --offset=-750000

# CW
PYTHONPATH=.:${PYTHONPATH} grcc sig6.grc
python3 sig6.py --samp-rate=${SAMP_RATE} --offset=-150000

# RTTY
grcc sig7.grc
python3 baud.py
python3 sig7.py --samp-rate=${SAMP_RATE} --offset=-550000

# M17
grcc sig8.grc
cat <(dd if=/dev/zero bs=16000 count=3) <(sox flag8.wav -r 8000 -t raw -) | ~/git/m17-cxx-demod/build/apps/m17-mod -S VE3IRR -b > flag8.bin
python3 sig8.py --samp-rate=${SAMP_RATE} --offset=-850000
