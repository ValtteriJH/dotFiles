#!/bin/bash
# Restart mouse drivers
# sudo systemctl restart logid

# XRANDR FOR i3 ext. screens!
xrandr --output DisplayPort-6 --primary
xrandr --output eDP --auto --below DisplayPort-6
xrandr --output DisplayPort-8 --auto --right-of DisplayPort-6
xrandr --output DisplayPort-8 --rotate left

picom --experimental-backends

hsetroot -fill .wallpaper.jpg
