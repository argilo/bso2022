#!/usr/bin/env python3

import math
import os

LONG_FILE = "sigid/sig.c32"
SHORT_FILES = ["demod/demod.c32", "lo/lo.c32"]

SAMPLE_SIZE = 8

long_samples = os.stat(LONG_FILE).st_size // SAMPLE_SIZE

for short_file in SHORT_FILES:
    short_samples = os.stat(short_file).st_size // SAMPLE_SIZE
    copies = long_samples // short_samples
    padding_samples = math.ceil(long_samples / copies) - short_samples
    with open(short_file, "ab") as f:
        f.write(bytes([0] * (SAMPLE_SIZE * padding_samples)))
