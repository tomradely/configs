#!/bin/sh
case "$(fcitx5-remote -n)" in
	"keyboard-us") ime="us" ;;
	"keyboard-gb") ime="gb" ;;
	"keyboard-ru-phonetic_winkeys") ime="ру" ;;
	"pinyin") ime="拼" ;;
esac
icon="󰌌"
printf "%s %s " "$icon" "$ime"
