#!/bin/sh
time=$(date '+%R')
timeicon='󱑇'
case $(date '+%u') in
	"1") day="月" ;;
	"2") day="火" ;;
	"3") day="水" ;;
	"4") day="木" ;;
	"5") day="金" ;;
	"6") day="土" ;;
	"7") day="日" ;;
esac
printf " %s %s %s " "$day" "$timeicon" "$time"
