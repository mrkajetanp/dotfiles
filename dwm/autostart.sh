#!/bin/bash

/home/kajetan/.bin/kbd &

xset r rate 250 60

nitrogen --head=0 --set-scaled /home/kajetan/Pictures/Wallpapers/Brighter/mountain_lake_bright.jpg
nitrogen --head=1 --set-scaled /home/kajetan/Pictures/Wallpapers/Brighter/0079-side.jpg

dunst &
picom &
xbanish &
lxsession &
greenclip daemon &
polychromatic-tray-applet &
/home/kajetan/.bin/battery-notification &

# wmname LG3D
