from libqtile import layout
from libqtile.config import Match

layouts = [
    layout.Bsp(margin=6, border_focus='#5294e2', border_normal='#2c5380',
               fair=False, border_on_single=True, margin_on_single=[30, 60, 30, 60]),

    layout.Max(margin=8, border_focus='#5294e2',
               border_normal='#2c5380', border_width=2),

    layout.Floating(border_normal='#2c5380', border_focus='#5294e2',
                    border_width=2, full_screen_border_width=2, max_border_width=2),
]

floating_layout = layout.Floating(float_rules=[
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
])
