#!/bin/bash

output=$(playerctl --player=spotify metadata --format "{{title}} by {{artist}}" 2>&1)
if [[ "$output" != "No players found" ]]; then
  echo "%{F#02c084}%{F-}" $output
fi
