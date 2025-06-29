#!/usr/bin/env python3
import json
import subprocess

ICON_MAP = {
    "firefox": "󰈹",
    "code": "󰨞",
    "discord": "󰙯",
    "alacritty": ""
}
DEFAULT_ICON = "󰍹"
FOCUSED_COLOR = "#ffcc00"
TOTAL_WORKSPACES = 5

def get_json(cmd):
    return json.loads(subprocess.run(cmd, capture_output=True).stdout.decode())

workspaces = get_json(["hyprctl", "workspaces", "-j"])
clients = get_json(["hyprctl", "clients", "-j"])

focused_id = next((w["id"] for w in workspaces if w.get("focused")), None)
workspace_apps = {i: [] for i in range(1, TOTAL_WORKSPACES + 1)}
for c in clients:
    ws_id = c["workspace"]["id"]
    if ws_id in workspace_apps:
        workspace_apps[ws_id].append(c["class"].lower())

icons = []
for ws_id in range(1, TOTAL_WORKSPACES + 1):
    apps = workspace_apps[ws_id]
    icon = next((ICON_MAP[a] for a in apps if a in ICON_MAP), DEFAULT_ICON)
    if ws_id == focused_id:
        icon = f"<span color='{FOCUSED_COLOR}'>{icon}</span>"
    icons.append(icon)

print(json.dumps({
    "text": " ".join(icons),
    "tooltip": "Click to switch workspace",
    "on-click": "hyprctl dispatch workspace e+1"
}))