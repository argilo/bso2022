#!/usr/bin/env python3

from io import BufferedIOBase
from baudot import encode_str, codecs, handlers

input_str = 'THIS IS VE3IRR. THE FLAG IS FOOBAR.'


class BitWriter(BufferedIOBase):
    def __init__(self):
        BufferedIOBase.__init__(self)
        self.bits = []

    def write(self, b):
        val = int(b, 16)
        new_bits = [
            0,
            val & 1,
            (val >> 1) & 1,
            (val >> 2) & 1,
            (val >> 3) & 1,
            (val >> 4) & 1,
            1,
            1,
        ]
        self.bits.extend(new_bits)

    def getvalue(self):
        return self.bits


out = BitWriter()
writer = handlers.HexBytesWriter(out)
encode_str(input_str, codecs.ITA2_STANDARD, writer)
print(out.getvalue())
