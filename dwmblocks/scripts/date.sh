#!/bin/sh
date=$(lunarcal --view=d | grep 癸卯 | awk '{print$2$3}') #This must be set once a year.
dateicon='󰃭'
printf "[ %s %s" "$dateicon" "$date"
