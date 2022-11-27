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
            print(f"New max: {mx}")
        if sample < mn:
            mn = sample
            print(f"New min: {mx}")

print()
print(f"Min sample: {mn}")
print(f"Max sample: {mx}")
