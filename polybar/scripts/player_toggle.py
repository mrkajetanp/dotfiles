#!/usr/bin/python

import subprocess

s = subprocess.run(["playerctl", "status"],
        stdout=subprocess.PIPE, stderr=subprocess.PIPE
        )
s = s.stdout.decode('utf-8').strip()

if s == "Playing" or s == "Stopped":
    print("")
else:
    print("")
