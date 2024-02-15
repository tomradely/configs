#!/bin/sh
date=$(lunarcal --view=d | grep 甲辰 | awk '{print$2$3}') #This must be set once a year.
dateicon='󰃭'
printf " %s %s" "$dateicon" "$date"
