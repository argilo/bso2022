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


def tts_wav(text, file, voice):
    subprocess.run([
        "espeak",
        "-v", voice,
        "-m",
        "-s", "140",
        "-g", "5",
        "-w", file,
        text
    ])


random.seed("sigid")

for part in (2, 3, 4, 5, 8):
    flag = gen_flag()
    phonetic = to_phonetic(flag)
    text = f"""
        This is V E 3 I R R.
        <break time="1000ms"/>
        For part {part}, the flag is: {phonetic}.
    """
    tts_wav(text, f"flag{part}.wav", "en-us")
    print(f"Part {part}: flag{{{flag}}}")
