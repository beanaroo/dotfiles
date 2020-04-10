#!/bin/bash

muted_icon="%{T3}"
unmuted_icon="%{T3}"

muted=$(pamixer --get-mute --default-source)
if [[ $muted == "true" ]]; then
    echo "%{F#65737E}$muted_icon"
else
    echo "%{F#B48EAD}$unmuted_icon"
fi
