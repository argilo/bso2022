#!/usr/bin/python3

import struct
import sys

mx = float("-inf")
mn = float("inf")

with open(sys.argv[1], "rb") as f:
    while True:
        data = f.read(4)
        if len(data) != 4:
            break
        sample = struct.unpack("f", data)[0]
        if sample > mx:
            mx = sample
        if sample < mn:
            mn = sample

print(f"Min sample: {mn}")
print(f"Max sample: {mx}")
