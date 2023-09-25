from modules.keys import keys, mod
from modules.groups import groups
from modules.layouts import layouts, floating_layout
from modules.mouse import mouse
from modules.hooks import *
import os
from modules.screens import screens
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
# main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "Qtile"
widget_defaults = dict(
        font='Cascadia Code',
        fontsize=13,
        padding=3
)

@hook.subscribe.client_new
def bring_to_front(client):
    if client.name == 'Screenshot':
        client.focus()
        client.enable_floating()
        client.bring_to_front()
        client.keep_above(True)
        client.move_to_top()
        client.move_up(True)
        


