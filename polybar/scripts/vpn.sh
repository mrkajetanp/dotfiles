#!/bin/bash

status=$(nordvpn status | head -1)

if [[ "$status" == *"Connected"* ]]; then
    ip=$(curl -s "https://ipinfo.io/ip")
    echo "%{F#d07ef2}廬%{F-} $ip"
elif [[ "$status" == *"check your internet connection"* ]]; then
    echo "%{F#ed404c}輦%{F-} No internet"
else
    echo "%{F#ed404c}輦%{F-} OFF"
fi
