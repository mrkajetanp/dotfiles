#!/usr/bin/python

import subprocess

s = subprocess.run([
    "playerctl", "--player=spotify", "metadata", "--format",
    "{{ title }} by {{ artist }}"
    ], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
s = s.stdout.decode('utf-8').strip()

print(s)

#if s:
#    print(s)
#    with open("/home/kajetan/.bin/status.txt", "w") as f:
#        f.write(s)
#else:
#    with open("/home/kajetan/.bin/status.txt", "r") as f:
#        file_data = f.readlines()
#        if len(file_data) > 0:
#            print(file_data[0])


