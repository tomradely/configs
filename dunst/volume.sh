#!/bin/bash
# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function send_notification {
    volume=`get_volume`
    bar=$(seq -s "─" $(($volume / 2)) | sed 's/[0-9]//g')
    pkill -RTMIN+11 dwmblocks && dunstify -i ~/.config/dunst/sysicon/audio-volume-high-symbolic.symbolic.png -t 8000 -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
}

function send_notification1 {
    volume=`get_volume`
    bar=$(seq -s "─" $(($volume / 2)) | sed 's/[0-9]//g')
    pkill -RTMIN+11 dwmblocks && dunstify -i ~/.config/dunst/sysicon/audio-volume-low-symbolic.symbolic.png -t 8000 -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
}
case $1 in
    up)
	# Set the volume on (if it was muted)
	amixer -D pulse set Master on > /dev/null
	amixer -D pulse sset Master 2%+ > /dev/null
	send_notification
	;;
    down)
	amixer -D pulse set Master on > /dev/null
	amixer -D pulse sset Master 2%- > /dev/null
	send_notification1
	;;
    mute)
    	# Toggle mute
	amixer -D pulse set Master 1+ toggle > /dev/null
	if is_mute ; then
        pkill -RTMIN+11 dwmblocks && dunstify -i ~/.config/dunst/sysicon/audio-volume-muted-symbolic.symbolic.png -t 8000 -r 2593 -u normal "Volume: Mute"
    else
        send_notification
	fi
	;;
esac

