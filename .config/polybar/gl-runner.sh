#!/bin/bash

icon="%{T3}"
liveness=$(curl -sL -w "%{http_code}\\n" $GITLAB_HEALTHCHECK -o /dev/null)

if [[ $liveness == "200" ]]; then
    if systemctl --user is-active gitlab-runner-ssh --quiet ;then
        echo "%{F#B48EAD}$icon"
    else
        echo "%{F#D08770}$icon"
    fi
else
    echo "%{F#4F5B66}$icon"
fi
