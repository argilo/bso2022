#!/usr/bin/env bash

set -e

SAMP_RATE=960000

python3 gen_flags.py

# Paint
grcc sig1.grc
convert \
  -background White \
  -gravity Center \
  -pointsize 150 \
  label:'Part #1 flag\{b2e2b3877aad4108\}' \
  -rotate 270 \
  -extent x2300 \
  -background Black \
  -extent 256x \
  flag1.png
python3 sig1.py --samp-rate=${SAMP_RATE} --offset=0

# NBFM
grcc sig2.grc
python3 sig2.py --samp-rate=${SAMP_RATE} --offset=200000

# AM
grcc sig3.grc
python3 sig3.py --samp-rate=${SAMP_RATE} --offset=-200000

# LSB
grcc sig4.grc
python3 sig4.py --samp-rate=${SAMP_RATE} --offset=100000

# USB
grcc sig5.grc
python3 sig5.py --samp-rate=${SAMP_RATE} --offset=-300000

sox flag8.wav -r 8000 -t raw - | ~/git/m17-cxx-demod/build/apps/m17-mod -S VE3IRR -b > flag8.bin

#PYTHONPATH=.:$PYTHONPATH grcc multi_tx.grc
#python3 multi_tx.py
