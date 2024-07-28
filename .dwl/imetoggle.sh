#!/bin/sh
case $(fcitx5-remote -n) in
	"keyboard-us") $(fcitx5-remote -s keyboard-gb) ;;
	"keyboard-gb") $(fcitx5-remote -s pinyin) ;;
	"pinyin") $(fcitx5-remote -s keyboard-ru-phonetic_YAZHERTY) ;;
	"keyboard-ru-phonetic_YAZHERTY") $(fcitx5-remote -s keyboard-us) ;;
esac
