#!/bin/sh

udiskie &
picom &
dunst &
clipmenud &
unclutter &

xrdb ~/.Xresources &

setxkbmap -option "altwin:swap_alt_win" -option "ctrl:swapcaps"
xset r rate 300 50
killall xcape 2>/dev/null ; xcape -e 'Control_L=Escape'
xset -q | grep "Caps Lock:\s*on" && xdotool key Caps_Lock

exec bspwm
