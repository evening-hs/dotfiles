from libqtile import layout
from libqtile.config import Match
import colors as saga

active_border_color = saga.border_active
inactive_border_color = saga.border_inactive
border_width = 4

layouts = [
    layout.Bsp(
        margin          = 6,
        border_focus    = active_border_color,
        border_normal   = inactive_border_color,
        fair            = False,
        border_on_single= True,
        margin_on_single= [30, 60, 30, 60],
        border_width    = border_width
    ),

    layout.Max(
        margin          = 8,
        border_focus    = active_border_color,
        border_normal   = inactive_border_color,
        border_width    = border_width
    ),

    layout.Floating(
        border_normal           = inactive_border_color,
        border_focus            = active_border_color,
        border_width            = border_width,
        fullscreen_border_width = border_width,
        max_border_width        = border_width
    ),
]

floating_layout = layout.Floating(
        border_normal           = inactive_border_color,
        border_focus            = active_border_color,
        border_width            = border_width,
        fullscreen_border_width = border_width,
        max_border_width        = border_width,
        float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
        Match(title='Screenshot'),
        Match(title='Pomodoro'),
        Match(title='Qalculate!'),
    ]
    )
