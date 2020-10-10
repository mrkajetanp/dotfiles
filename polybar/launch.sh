#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar topbar -r &
polybar bottombar -r &
polybar second-top-bar -r &
polybar second-bottom-bar -r &
