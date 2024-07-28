#!/bin/sh
INTERVAL=3

printf -- '%s\n' "wifiicon|string|"
printf -- '%s\n' "speed|string|"
printf -- '%s\n' "tunicon|string|"
printf -- '%s\n' ""

while true; do
	if [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'up' ] ; then
		wifiicon="$(awk '/^\s*w/ { print "󰖩  ", int($3 * 100 / 70) "% " }' /proc/net/wireless)"
	elif [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = 'down' ] ; then
		[ "$(cat /sys/class/net/w*/flags 2>/dev/null)" = '0x1003' ] && wifiicon="󰤯  " || wifiicon="󰖪  "
	fi
	[ -n "$(cat /sys/class/net/tun*/operstate 2>/dev/null)" ] && tunicon="󰌾  "
	update() {
    	sum=0
    	for arg; do
        	read -r i < "$arg"
        	sum=$(( sum + i ))
    	done
	    cache=/tmp/${1##*/}
	    [ -f "$cache" ] && read -r old < "$cache" || old=0
	    printf %d\\n "$sum" > "$cache"
	    printf %d\\n $(( sum - old ))
	}
	rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes | numfmt --to=iec)
	#tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)
	printf -- '%s\n' "wifiicon|string|${wifiicon}"
	printf -- '%s\n' "speed|string|${rx}"
	printf -- '%s\n' "tunicon|string|${tunicon}"
	printf -- '%s\n' ""
  sleep $INTERVAL
done
