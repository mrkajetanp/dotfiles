#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar topbar -r &
polybar bottombar -r &

# if [[ -n "$MONITOR_SECOND" ]]; then
# polybar second-top-bar -r &
# polybar second-bottom-bar -r &
# fi

if [[ -n "$MONITOR_THIRD" ]]; then
  polybar third-top-bar -r &
  polybar third-bottom-bar -r &
fi
