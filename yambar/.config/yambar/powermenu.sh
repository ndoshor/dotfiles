#!/bin/sh
choice=$(printf 'Power off\nReboot\nLog out\nSwitch user\n' | fuzzel --dmenu -l 4 -p "Power: ")

case "$choice" in
  "Power off")   systemctl poweroff ;;
  "Reboot")      systemctl reboot ;;
  "Log out")     riverctl exit ;;
  "Switch user") dm-tool switch-to-greeter 2>/dev/null || loginctl terminate-user "$USER" ;;
esac
