#!/bin/bash
# Restart mouse drivers
# sudo systemctl restart logid
#
# Set in order the displays right of each other if theres 3 of them, rotate the last one by 90 deg

# XRANDR FOR i3 ext. screens!


connectedDisplays=$(xrandr | grep mm | cut -d " " -f1)
if [ $(echo "$connectedDisplays" | wc -l) -eq 3 ]; then
	currentRow=0
	previousDisplay=?
	echo $connectedDisplays
	while IFS= read -r i j k;
	do
		if (( $currentRow == 0 )) ;then
			previousDisplay="$i"
			echo $i
		fi
		if [ "$currentRow" -eq 1 ];then
			xrandr --output "$i" --right-of "$previousDisplay"
			previousDisplay="$i"
			echo $i
		fi
		if [ "$currentRow" -eq 2 ];then
			xrandr --output "$i" --right-of "$previousDisplay"
			xrandr --output "$i" --rotate left
			previousDisplay="$i"
			echo ROTATED $i
		fi
		currentRow=$((currentRow+1))
	done <<< "$connectedDisplays"
fi

picom --experimental-backends

hsetroot -fill .wallpaper.jpg


