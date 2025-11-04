#!/bin/sh
# Uncomment to enable additional input methods
#case $(fcitx5-remote -n) in
#	"keyboard-us") $(fcitx5-remote -s keyboard-gb) ;;
#	"keyboard-gb") $(fcitx5-remote -s pinyin) ;;
#	"pinyin") $(fcitx5-remote -s cangjie5) ;;
#	"cangjie5") $(fcitx5-remote -s zhuyin) ;;
#	"zhuyin") $(fcitx5-remote -s keyboard-ru-phonetic_YAZHERTY) ;;
#	"keyboard-ru-phonetic_YAZHERTY") $(fcitx5-remote -s keyboard-us) ;;
#esac

case $(fcitx5-remote -n) in
	"keyboard-us") $(fcitx5-remote -s pinyin) ;;
	"pinyin") $(fcitx5-remote -s keyboard-ru-phonetic_YAZHERTY) ;;
	"keyboard-ru-phonetic_YAZHERTY") $(fcitx5-remote -s keyboard-us) ;;
esac
