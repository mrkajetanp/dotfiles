#!/usr/bin/python

import subprocess

brightness = subprocess.run(
        ["cat", "/sys/class/backlight/intel_backlight/brightness"],
        stdout=subprocess.PIPE).stdout.decode('utf-8').strip()

max_brightness = subprocess.run(
        ["cat","/sys/class/backlight/intel_backlight/max_brightness"],
        stdout=subprocess.PIPE).stdout.decode('utf-8').strip()

print(' ' + str(round(int(brightness) / int(max_brightness) * 100)) + '%')


