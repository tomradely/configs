#!/bin/bash
# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute
# 

function get_volume {
    pactl get-sink-volume \@DEFAULT_SINK@ | head -n 1 | cut -d '/' -f 2 | cut -d '%' -f 1 
}

function muted {
	pactl get-sink-mute \@DEFAULT_SINK@ | grep -oE '[^ ]+$' | grep yes > /dev/null
}

# If using images for notifications, consider using one for up and one for down.
function send_notification_up {
    volume=`get_volume`
    bar=$(seq -s "─" $(($volume / 2)) | sed 's/[0-9]//g')
    dunstify -i ~/.icons/Papirus-Dark/48x48/status/notification-audio-volume-high.svg -t 8000 -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
}
function send_notification_down {
    volume=`get_volume`
    bar=$(seq -s "─" $(($volume / 2)) | sed 's/[0-9]//g')
    dunstify -i ~/.icons/Papirus-Dark/48x48/status/notification-audio-volume-medium.svg -t 8000 -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
}

# If not using images, one notification entry will suffice
#function send_notification {
#    volume=`get_volume`
#    bar=$(seq -s "─" $(($volume / 2)) | sed 's/[0-9]//g')
#    dunstify -t 8000 -r 2593 -u normal -h int:value:"$volume" "Volume: ${volume}%"
#}

case $1 in
    up)
	if muted ; then
		pactl set-sink-mute \@DEFAULT_SINK@ off
		send_notification_up
	else
	pactl set-sink-volume \@DEFAULT_SINK@ +2%
	send_notification_up
	fi
	;;
    down)
	if muted ; then
		pactl set-sink-mute \@DEFAULT_SINK@ off
		send_notification_down
	else
	pactl set-sink-volume \@DEFAULT_SINK@ -2%
	send_notification_down
	fi
	;;
    mute)
	pactl set-sink-mute \@DEFAULT_SINK@ toggle
	if muted ; then
		dunstify -i ~/.icons/Papirus-Dark/48x48/status/notification-audio-volume-muted.svg -t 8000 -r 2593 -u normal "Volume: Mute"
	else
		send_notification_up
	fi
	;;
esac

