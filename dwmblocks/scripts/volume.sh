#!/bin/sh
vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
[ "$vol" != "${vol%\[MUTED\]}" ] && echo " 󰝟 " && exit
vol="${vol#Volume: }"

split() {
	IFS=$2
	set -- $1
	printf '%s' "$@"
}

vol="$(printf "%.0f" "$(split "$vol" ".")")"

case 1 in
	$((vol >= 50)) ) icon="󰕾" ;;
	$((vol <= 50)) ) icon="󰖀" ;;
esac
printf " %s " "$icon"
