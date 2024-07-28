#!/bin/sh
INTERVAL=60

printf -- '%s\n' "dateicon|string|"
printf -- '%s\n' "ldate|string|"
printf -- '%s\n' "day|string|"
printf -- '%s\n' ""

while true; do
	ldate=$(lunarcal --view=d | grep 甲辰 | awk '{print$2$3}') #This must be set once a year.
	dateicon='󰃭'
	case $(date '+%u') in
		"1") day="月" ;;
		"2") day="火" ;;
		"3") day="水" ;;
		"4") day="木" ;;
		"5") day="金" ;;
		"6") day="土" ;;
		"7") day="日" ;;
	esac
	printf -- '%s\n' "dateicon|string|${dateicon}"
	printf -- '%s\n' "ldate|string|${ldate}"
	printf -- '%s\n' "day|string|${day}"
	printf -- '%s\n' ""
  sleep $INTERVAL
done
