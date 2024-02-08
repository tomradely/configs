#!/bin/sh
case $(amixer get Master | tail -c5) in
	"[on]") icon="󰓃" ;;
	"off]") icon="󰝟" ;;
esac
##vol=$(amixer get Master | awk -v FS="[[%]" '/%/ { print $2 }')
printf " %s " "$icon" #"$vol"
