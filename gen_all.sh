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

python3 resize.py

grcc combine.grc
python3 combine.py

grcc usrp_tx.grc
