from libqtile import bar
from .widgets import *
from libqtile.config import Screen
from modules.keys import terminal
import os

simple_bar = bar.Bar([
                widget.GroupBox(
                    highlight_method='line',
                    this_screen_border="#5294e2",
                    this_current_screen_border="#5294e2",
                    active="#ffffff",
                    inactive="#848e96",
                    background="#2f343f"
                ),
    ],
        30,  # height in px
        background="#404552",
        opacity=0.75,
        margin=6,
    )

default_bar = bar.Bar(
        [
            widget.GroupBox(
                active="#ffffff",
                background='#131313',
                dissable_drag=True,
                highlight_method='block',
                inactive='#ffffff',
                this_current_screen_border="#ff0000",
                ),
            widget.Spacer(),
            widget.Sep(size_percent=1),
            # calendar
            widget.Clock(
                background="#131313",
                format="%b %d"
                ),
            # clock
            widget.Clock(
                background="#131313"
                ),
            widget.Spacer(),
            widget.WidgetBox(
                widgets=[
                    widget.Systray(),
                    ]
                ),
            widget.Sep(size_percent=1),
            MyPomodoro(
                background="#262626",
                color_active="#ffffff",
                color_inactive="#ffffff",
                color_break="#ff9999",
                length_long_break=5,
                length_short_break=2,
                length_pomodori=15,
                prefix_inactive='\ue001'
                ),
            widget.Sep(size_percent=1),
            widget.Battery(
                background="#131313",
                format = '{percent:2.0%}',
                low_background="#ff9999"
                )
        ],
        30,  # height in px
        background="#00000000",
        opacity=1,
        margin=6,
    )

screens = [
    Screen(top=default_bar,wallpaper="~/.local/share/backgrounds/lighthouse.jpg",wallpaper_mode="fill"),
    Screen(bottom=simple_bar,wallpaper="~/.local/share/backgrounds/lighthouse.jpg",wallpaper_mode="fill"),
]
