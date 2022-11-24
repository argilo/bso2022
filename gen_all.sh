#!/usr/bin/env bash

set -e

cd demod
./gen.sh
cd ..

cd lo
./gen.sh
cd ..

cd sigid
./gen.sh
cd ..

grcc combine.grc
python3 combine.py

grcc usrp_tx.grc
