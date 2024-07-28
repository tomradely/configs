#!/bin/sh
printf -- '%s\n' "icon|string|"
printf -- '%s\n' "ime|string|"
printf -- '%s\n' ""

dbus-monitor --profile 'interface=org.fcitx.Fcitx.Controller1,member=SetCurrentIM' |
while read -r _; do
	case "$(fcitx5-remote -n)" in
		"keyboard-us") ime="us" ;;
		"keyboard-gb") ime="gb" ;;
		"keyboard-ru-phonetic_YAZHERTY") ime="ру" ;;
		"pinyin") ime="拼" ;;
	esac
	printf -- '%s\n' "icon|string|${icon}"
	printf -- '%s\n' "ime|string|${ime}"
	printf -- '%s\n' ""
done
