#!/bin/bash
maim /tmp/screenshot.png
convert /tmp/screenshot.png -scale 20% /tmp/screenshotsmall.png
convert /tmp/screenshotsmall.png -scale 500% /tmp/screenshotpxl.png
i3lock -u -i /tmp/screenshotpxl.png

