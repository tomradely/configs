#!/bin/sh
capacity=$(cat /sys/class/power_supply/BAT0/capacity 2>&1)
case "$(cat "/sys/class/power_supply/BAT0/status" 2>&1)" in
	"Full") status="󰚥" ;;
	"Not charging") status="󰚥" ;;
	"Charging") status="󰂅" ;;
	"Discharging") status="󱟞" ;;
esac
printf "[ %s %s%%]" "$status" "$capacity"
