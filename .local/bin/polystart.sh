#!/bin/bash
set -x

# Sensitive env vars or bar modules
export GITLAB_HEALTHCHECK=''
export WEATHER_KEY=''
export WEATHER_CITY=''


if pgrep -u $UID -x polybar > /dev/null; then

    logger "Killing polybar"
    killall -q polybar
    pkill polybar

    while pgrep -u $UID -x polybar >/dev/null; do
        logger "Waiting for polybar to die"
        sleep 1
    done
fi

for monitor in $(polybar -m | cut -d ':' -f1); do

    logger "Starting polybar - Top bar on $monitor"
    MONITOR=$monitor polybar top &> /dev/null &

    logger "Starting polybar - Bottom bar on $monitor"
    MONITOR=$monitor polybar bottom &> /dev/null &

done
