#!/bin/sh
if command -v wpctl >/dev/null 2>&1; then
  case "$1" in
    up)   wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+ ;;
    down) wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- ;;
    mute) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
  esac
else
  case "$1" in
    up)   amixer set Master 5%+ ;;
    down) amixer set Master 5%- ;;
    mute) amixer set Master toggle ;;
  esac
fi