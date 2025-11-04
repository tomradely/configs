#!/bin/bash
exec ~/.config/dwl/swayidle.sh &
wbg /home/tom/Pictures/gardenofwords1.jpg &
exec systemd --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway &
systemctl --user restart pipewire.service &
