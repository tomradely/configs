#!/bin/sh
capacity=$(cat /sys/class/power_supply/BAT0/capacity 2>&1)
case "$(cat "/sys/class/power_supply/BAT0/status" 2>&1)" in
	"Full") status="󰚥" ;;
	"Not charging") status="󰚥" ;;
	"Charging") status="󰂄" ;;
	"Discharging") set -- $1 && case 1 in
		$((capacity >=90)) ) status="󰂂" ;;
		$((capacity >=80)) ) status="󰂁" ;;
		$((capacity >=70)) ) status="󰂀" ;;
		$((capacity >=60)) ) status="󰁿" ;;
		$((capacity >=50)) ) status="󰁾" ;;
		$((capacity >=40)) ) status="󰁽" ;;
		$((capacity >=30)) ) status="󰁼" ;;
		$((capacity >=20)) ) status="󰁻" ;;
		$((capacity >=10)) ) status="󰁺 !" ;;
		$((capacity >=5)) ) status="󰂎 !!" ;;
	 esac;;
esac
printf " %s %s%% " "$status" "$capacity"
