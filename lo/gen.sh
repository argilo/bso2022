#!/usr/bin/env bash

set -e

python3 gen_flags.py

grcc lo1.grc
python3 lo1.py

grcc lo2.grc
python3 lo2.py
