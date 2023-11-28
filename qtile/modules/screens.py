from libqtile import bar
from .widgets import *
from libqtile.config import Screen
from modules.keys import terminal
import os
import colors as saga

default_bar = bar.Bar(
        [
            widget.GroupBox(
                active                      = saga.background,
                background                  = saga.celeste,
                dissable_drag               = True,
                highlight_method            = 'block',
                inactive                    = saga.background_secondary,
                this_current_screen_border  = saga.mauve,
                rounded                     = False,
                block_highlight_text_color  = saga.background,
                ),

            widget.Spacer(),

            # calendar
            widget.Clock(
                background=saga.blond,
                foreground=saga.background_secondary,
                format="%b %d"
                ),

            # clock
            widget.Clock(
                background=saga.blond,
                foreground=saga.background_secondary,
                ),

            widget.Spacer(),

            widget.WidgetBox(
                widgets=[
                    widget.Systray(),
                    ],
                ),

            widget.Sep(size_percent=1),

            MyPomodoro(
                background          = saga.menthol,
                color_active        = saga.background,
                color_inactive      = saga.background,
                color_break         = saga.danger,
                length_long_break   = 5,
                length_short_break  = 2,
                length_pomodori     = 15,
                prefix_inactive     = '\ue001'
                ),

            widget.Sep(size_percent=1),

            widget.Battery(
                background      = saga.mauve,
                format          = '{percent:2.0%}',
                low_background  = saga.danger,
                foreground      = saga.background
                )
        ],
        32,  # height in px
        background="#00000000",
        opacity=1,
        margin=6,
    )

screens = [
    Screen(bottom=default_bar,wallpaper="~/.local/share/backgrounds/Pink Floyd Catppuccin.png",wallpaper_mode="fill"),
]
