#!/bin/bash
# You can call this script like this:
# $./screenlight.sh up
# $./screenlight.sh down

function get_brightness {
    brightnessctl i | grep -i current | awk '{print $4}' | sed 's/(//' | sed 's/)//'
}

# Notifcations with images are currently throwing errors, presumably due to an issue with Dunst
#function send_notification {
#    brightness=`get_brightness`
#    # Send the notification
#     dunstify -i ~/.local/share/icons/GNUstep/apps/48/brightnesssettings.png -t 8000 -r 2593 -u normal -h int:value:"$brightness" "Brightness: ${brightness}"
#}

#function send_notification1 {
#    brightness=`get_brightness`
#    # Send the notification
#     dunstify -i ~/.local/share/icons/GNUstep/apps/48/brightnesssettings.png -t 8000 -r 2593 -u normal -h int:value:"$brightness" "Brightness: ${brightness}"
#}

function send_notification {
    brightness=`get_brightness`
    # Send the notification
     dunstify -t 8000 -r 2593 -u normal -h int:value:"$brightness" "Brightness: ${brightness}"
}

function send_notification1 {
    brightness=`get_brightness`
    # Send the notification
     dunstify -t 8000 -r 2593 -u normal -h int:value:"$brightness" "Brightness: ${brightness}"
}

case $1 in
    up)
	brightnessctl set 2%+
	send_notification
	;;
    down)
	brightnessctl set 2%-
	send_notification1
	;;
esac
