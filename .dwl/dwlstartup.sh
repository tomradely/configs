#!/bin/bash
dwlmsg -w > /home/tom/.dwl_info &
wbg /home/tom/Pictures/005.jpg &
exec ~/.config/.dwl/swayidle.sh &
