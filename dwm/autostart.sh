#!/bin/bash

/home/kajetan/.bin/kbd &

xset r rate 250 60

nitrogen --head=0 --set-scaled /home/kajetan/Pictures/Wallpapers/Brighter/mountain_lake_bright.jpg
nitrogen --head=1 --set-scaled /home/kajetan/Pictures/Wallpapers/Brighter/0079-side.jpg

killall dunst
dunst &

picom &

killall xbanish
xbanish &

killall lxsession
lxsession &

# wmname LG3D

killall battery-notification
/home/kajetan/.bin/battery-notification &

killall greenclip
greenclip daemon &

# st &
