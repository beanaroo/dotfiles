#!/bin/bash

unlock_icon="%{T3}"
lock_icon="%{T3}"

pgrep -u root openconnect &> /dev/null
if [[ $? -eq 0 ]]; then
    echo "%{F#BF616A}$lock_icon"
else
    echo "%{F#65737E}$unlock_icon"
fi
