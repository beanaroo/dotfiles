#!/bin/bash

mute_state=$(pamixer --get-mute)
mute_color="%{F#65737E}"
mute_icon="%{T3}%{T-}"

if [[ $mute_state = "true" ]]; then
   echo "${mute_color}${mute_icon} ──────────"
   exit
fi

icon_color="%{F#8FA1B3}"
soft_color="%{F#A3BE8C}"
loud_color="%{F#EBCB8B}"
warn_color="%{F#D08770}"
max_color="%{F#BF616A}"
reset_color="%{F-}"
icon="%{T3}${icon_color}%{T-}"
indicator="${reset_color}|"
vol=$(pamixer --get-volume)

if [[ vol -le 10 ]]; then
    echo "${icon} ${indicator}─────────"
elif [[ vol -le 15 ]]; then
    echo "${icon} ${soft_color}━${indicator}────────"
elif [[ vol -le 20 ]]; then
    echo "${icon} ${soft_color}━━${indicator}───────"
elif [[ vol -le 25 ]]; then
    echo "${icon} ${soft_color}━━━${indicator}──────"
elif [[ vol -lt 35 ]]; then
    echo "${icon} ${soft_color}━━━━${indicator}─────"
elif [[ vol -lt 40 ]]; then
    echo "${icon} ${loud_color}━━━━${indicator}─────"
elif [[ vol -lt 50 ]]; then
    echo "${icon} ${loud_color}━━━━━${indicator}────"
elif [[ vol -lt 55 ]]; then
    echo "${icon} ${loud_color}━━━━━━${indicator}───"
elif [[ vol -lt 60 ]]; then
    echo "${icon} ${loud_color}━━━━━━━${indicator}──"
elif [[ vol -lt 80 ]]; then
    echo "${icon} ${warn_color}━━━━━━━${indicator}──"
elif [[ vol -lt 85 ]]; then
    echo "${icon} ${warn_color}━━━━━━━━${indicator}─"
elif [[ vol -lt 90 ]]; then
    echo "${icon} ${max_color}━━━━━━━━${indicator}─"
else
    echo "${icon} ${max_color}━━━━━━━━━${indicator}"
fi
