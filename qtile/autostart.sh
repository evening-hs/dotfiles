#!/bin/sh
feh --bg-scale /usr/share/endeavouros/backgrounds/endeavouros-wallpaper.png
picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed

# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown

# Keyboard layouts
# Disabled because I'm using ibus now
# ~/.config/qtile/scripts/keyboard.sh & disown

# Network Manager icon
nm-applet & disown

# Touchegg (For touchpad gestures)
touchegg --client & disown

# Ibus daemon
~/.config/qtile/scripts/ibus.sh & disown

# Start welcome
eos-welcome & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
