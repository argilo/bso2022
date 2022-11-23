#!/usr/bin/env bash

set -e

python3 gen_flags.py

convert \
  -background White \
  -gravity Center \
  -pointsize 150 \
  label:'Part #1 flag\{b2e2b3877aad4108\}' \
  -rotate 270 \
  -extent x2300 \
  -background Black \
  -extent 256x \
  paint.png

grcc paint_flag.grc
python3 paint_flag.py

sox flag8.wav -r 8000 -t raw - | ~/git/m17-cxx-demod/build/apps/m17-mod -S VE3IRR -b > flag8.bin

PYTHONPATH=.:$PYTHONPATH grcc multi_tx.grc
python3 multi_tx.py
