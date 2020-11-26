#!/bin/bash

# /home/kajetan/.bin/kbd &
setxkbmap -layout pl -variant kdvp2

xset r rate 250 60

xrandr --output eDP-1 --output HDMI-2 --primary --left-of eDP-1 --output DP-1 --left-of HDMI-2 --rotate left

nitrogen --head=0 --set-scaled /home/kajetan/Pictures/Wallpapers/Brighter/mountain_lake_bright.jpg
nitrogen --head=1 --set-scaled /home/kajetan/Pictures/Wallpapers/Brighter/0140.jpg
nitrogen --head=2 --set-scaled /home/kajetan/Pictures/Wallpapers/Brighter/0079-side.jpg

dunst &
picom &
xbanish &
lxsession &
greenclip daemon &
polychromatic-tray-applet &
batsignal -b &

# wmname LG3D
