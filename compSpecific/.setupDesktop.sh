#!/bin/bash
# Add BitBucket key to session
# ssh-add FSSH/FujitsuKey

# Restart mouse drivers
# sudo systemctl restart logid

# XRANDR FOR i3 ext. screens!
xrandr --output DP-0 --primary
xrandr --output HDMI-0 --auto --left-of DP-0
xrandr --output DP-4 --auto --right-of DP-0
xrandr --output DP-4 --rotate left

picom

