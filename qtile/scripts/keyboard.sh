# !/usr/bin
# 
# Requires the `ibus` package.
# For more information visit:
# https://wiki.archlinux.org/title/IBus

# Set the compose key as Left Alt
setxkbmap -option "compose:rctrl"

# Start the ibux daemon
ibus-daemon -rxR

