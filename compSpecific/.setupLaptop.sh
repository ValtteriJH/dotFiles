#!/bin/bash
# Restart mouse drivers
# sudo systemctl restart logid

eval "$(ssh-agent -s)"

# XRANDR FOR i3 ext. screens!

xrandr --auto
xrandr --output DisplayPort-1 --right-of eDP
xrandr --output HDMI-A-0 --right-of DisplayPort-1
xrandr --output HDMI-A-0 --rotate right

hsetroot -fill ~/.config/wpShuffler/.wallpaper.jpg

picom --experimental-backends

