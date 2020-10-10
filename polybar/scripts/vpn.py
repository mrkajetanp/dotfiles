#!/usr/bin/python

import subprocess

s = subprocess.run(["nordvpn", "status"], stdout=subprocess.PIPE)
status = s.stdout.decode('utf-8').split('\n')[0].split(':')[1].strip()

if status == "Connected":
    ip = subprocess.run(["curl", "-s", "https://ipinfo.io/ip"],
            stdout=subprocess.PIPE)
    ip = ip.stdout.decode('utf-8').strip()
    print("%{F#d07ef2}廬%{F-} " + ip)
else:
    print("%{F#ed404c}輦%{F-} OFF")
