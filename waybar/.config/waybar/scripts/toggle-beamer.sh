#!/bin/bash

# Configuration
MONITOR_NAME="HDMI-A-4"
RESOLUTION="3840x2160@60"
POSITION="3440x0"
SCALE="1"

# Check monitor status
STATUS=$(hyprctl monitors all -j | jq -r '.[] | select(.name == "'$MONITOR_NAME'") | .disabled')

# If called with 'toggle', switch monitor state
if [ "$1" = "toggle" ]; then
    if [ "$STATUS" = "true" ]; then
        # Turn on the monitor
        hyprctl keyword monitor "$MONITOR_NAME,$RESOLUTION,$POSITION,$SCALE" > /dev/null
        echo '{"text": " 󰶐 ", "class": "off"}'
    else
        # Turn off the monitor
        hyprctl keyword monitor "$MONITOR_NAME,disable" > /dev/null
        echo '{"text": " 󰍹 ", "class": "on"}'
    fi

else
    # Always output status (for Waybar)
    if [ "$STATUS" = "true" ]; then
        echo '{"text": " 󰶐 ", "class": "off"}'
    else
        echo '{"text": " 󰍹 ", "class": "on"}'
    fi
fi