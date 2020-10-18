#!/bin/bash

output=$(playerctl --player=spotify metadata --format "{{title}} by {{artist}}")
echo "%{F#02c084}%{F-}" $output
