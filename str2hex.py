#!/usr/bin/env python3

import sys

if len(sys.argv) != 2:
    print(f"Usage: {sys.argv[0]} STRING")
    sys.exit(0)

s = sys.argv[1]
out = ""

for i in range(len(s) - 1, -1, -1):
    hex_val = ord(s[i])
    val = str(format(hex_val, "x"))

    out += val

print('\n' + out)
