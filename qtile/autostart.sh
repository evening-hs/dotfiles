#!/bin/sh
feh --bg-fill ~/.local/share/backgrounds/planet.jpg

# Avoid launching picom on wayland as it hangs the system
if [ "$XDG_SESSION_TYPE" = "x11" ]
then
  picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed
fi

# Low battery notifier
~/.config/qtile/scripts/check_battery.sh & disown

# Keyboard layouts
~/.config/qtile/scripts/keyboard.sh & disown

# Network Manager icon
nm-applet & disown

# Touchegg (For touchpad gestures)
touchegg --client & disown

# Screen locker
light-locker & disown

# Start welcome
eos-welcome & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
