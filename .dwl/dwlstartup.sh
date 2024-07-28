#!/bin/bash
dwlmsg -w > /home/tom/.dwl_info &
# yambar &
wbg /home/tom/Pictures/005.jpg &
# dunst &
# lxqt-policykit-agent &
exec ~/.config/.dwl/swayidle.sh &
