#!/usr/bin/env python3

import random
import string
import subprocess

alphabet = {
    "a": "Alfa",
    "b": "Bravo",
    "c": "Charlie",
    "d": "Delta",
    "e": "Echo",
    "f": "Foxtrot",
    "g": "Golf",
    "h": "Hotel",
    "i": "India",
    "j": "Juliett",
    "k": "Kilo",
    "l": "Lima",
    "m": "Mike",
    "n": "November",
    "o": "Oscar",
    "p": "Papa",
    "q": "Quebec",
    "r": "Romeo",
    "s": "Sierra",
    "t": "Tango",
    "u": "Uniform",
    "v": "Victor",
    "w": "Whiskey",
    "x": "X-ray",
    "y": "Yankee",
    "z": "Zulu",
}


def to_phonetic(s):
    return " ".join(alphabet[letter] for letter in s)


def gen_flag():
    return "".join(random.choice(string.ascii_lowercase) for _ in range(16))


for part in (1, 2):
    flag = gen_flag()
    phonetic = to_phonetic(flag)
    text = f"""
        This is V E 3 I R R.
        <break time="1000ms"/>
        For part {part}, the flag is: {phonetic}.
    """
    subprocess.run([
        "espeak",
        "-ven-us",
        "-m",
        "-s", "140",
        "-g", "5",
        "-w", f"flag{part}.wav", text
    ])
    print(f"Part {part}: flag{{{flag}}}")
