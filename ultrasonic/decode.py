#!/usr/bin/env python3

with open("rx.dat", "rb") as f:
    bits = f.read() + b"\x01"

print(len(bits))
for offset in range(8):
    bb = []
    for i in range(offset, len(bits)-7, 8):
        b = 0
        for j in range(8):
            b = (b << 1) | bits[i+j]
        bb.append(b)
    bb = bytes(bb)
    if b"flag" in bb:
        print(bb)
