#!/bin/bash

icon="%{T3}"

pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
    temp=$(redshift -p 2>/dev/null | grep temp | cut -d' ' -f3)
    temp=${temp//K/}
fi

if [[ -z $temp ]]; then
    echo "%{F#65737E}$icon"
elif [[ $temp -ge 5000 ]]; then
    echo "%{F#8FA1B3}$icon"
elif [[ $temp -ge 4000 ]]; then
    echo "%{F#EBCB8B}$icon"
else
    echo "%{F#D08770}$icon"
fi
