#!/bin/bash
# System
exec systemd --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway &
systemctl --user restart pipewire.service &
exec ~/.config/dwl/swayidle.sh &
kanshi &
lxqt-policykit-agent &
wl-paste --watch cliphist store &
# Interface and Appearance
waybar &
dunst &
wbg /home/tom/Pictures/gardenofwords1.jpg &
# Autostarted applications
/opt/Mullvad\ VPN/mullvad-gui &
foot &
floorp &
