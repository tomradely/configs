#!/bin/sh
case "$(qdbus org.fcitx.Fcitx5 /controller org.fcitx.Fcitx.controller1.CurrentInputMethod)" in
	"keyboard-us") ime="us" ;;
	"keyboard-gb") ime="gb" ;;
	"keyboard-ru-phonetic_winkeys") ime="ру" ;;
	"pinyin") ime="拼" ;;
esac
icon="󰌌"
printf "[%s]" "$ime"
