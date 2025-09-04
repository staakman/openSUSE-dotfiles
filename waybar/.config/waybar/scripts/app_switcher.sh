#!/usr/bin/env bash

APP_CLASS="$1"  # e.g. "firefox"
APP_EXEC="$2"   # e.g. "firefox"

if [[ -z "$APP_CLASS" || -z "$APP_EXEC" ]]; then
  echo "Usage: $0 <AppClass> <AppExec>"
  exit 1
fi

clients=$(hyprctl clients -j | jq -r '.[] | select(.class == "'"$APP_CLASS"'") | {workspace: .workspace.id, address: .address, title: .title}' | jq -s '.')

if [[ $(echo "$clients" | jq length) -eq 0 ]]; then
    # Not running, launch app
    $APP_EXEC &
    exit 0
fi

if [[ $(echo "$clients" | jq length) -eq 1 ]]; then
    # One instance, switch to workspace
    workspace=$(echo "$clients" | jq -r '.[0].workspace')
    hyprctl dispatch workspace "$workspace"
    exit 0
fi

# Multiple instances
choices=$(echo "$clients" | jq -r 'to_entries[] | "\(.key): workspace: \(.value.workspace) -> \(.value.title)"' | sed 's/&/\&amp;/g')
choice=$(echo "$choices" | rofi -markup-rows -dmenu -p "Select $APP_CLASS window" -theme dracula | cut -d: -f1)

if [[ -n "$choice" ]]; then
    workspace=$(echo "$clients" | jq -r ".[$choice].workspace")
    hyprctl dispatch workspace "$workspace"
fi 