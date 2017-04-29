#!/bin/bash

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title | cut -d'-' -f1 | sed 's/ $//')"
fi

if [[ $player_status = "Playing" ]]; then
    echo "%{F#D08770}%{T3} %{T-} $metadata"
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#65737E}%{T3} %{T-} $metadata"
else
    echo "%{F#65737E}%{T3} %{T-}"
fi
