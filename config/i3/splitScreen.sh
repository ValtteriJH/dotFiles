#!/usr/bin/env bash
#set -e

OUT="HDMI-A-0"

read W H < <(
  xrandr | awk -v out="$OUT" '
    $1==out && $2=="connected" {
      for (i=1; i<=NF; i++) {
        if ($i ~ /^[0-9]+x[0-9]+\+[0-9]+\+[0-9]+$/) {
          split($i,a,/[-+x]/)
          print a[1], a[2]
          exit
        }
      }
    }
  '
)

TOP=$((H * 33 / 100))
BOTTOM=$((H - TOP))

#xrandr --delmonitor top 2>/dev/null || true
#xrandr --delmonitor bottom 2>/dev/null || true

xrandr --setmonitor top    "${W}/0x${TOP}/0+0+0"       none
xrandr --setmonitor bottom "${W}/0x${BOTTOM}/0+0+${TOP}" none


