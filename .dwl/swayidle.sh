#!/usr/bin/env bash
#for_window [class=".*"] inhibit_idle fullscreen
#for_window [app_id=".*"] inhibit_idle fullscreen
#swayidle -w \
#	timeout 200 'waylock -fork-on-lock' \
#	timeout 300 'wlr-randr --output DP-2 --off ; wlr-randr --output eDP-1 --off' \
#		resume 'wlr-randr --output eDP-1 --on --scale 1.8 ; wlr-randr --output DP-2 --on --scale 1.8' \
#	before-sleep 'waylock -fork-on-lock'
swayidle -w \
	timeout 300 'waylock -init-color 0x272e33 -input-color 0xa7c080 -fail-color 0xe67e80 -fork-on-lock' \
	timeout 900 'systemctl suspend' \
	before-sleep 'waylock -init-color 0x272e33 -input-color 0xa7c080 -fail-color 0xe67e80 -fork-on-lock'
