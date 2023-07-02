from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import keys, mod

@lazy.function
def window_to_prev_group(qtile):
    current_group = qtile.groups.index(qtile.current_group)
    new_group = current_group - 1 if current_group != 0 else 9
    if qtile.current_window is not None:
        qtile.current_window.togroup(qtile.groups[new_group].name)
        qtile.current_screen.toggle_group(qtile.groups[new_group])

@lazy.function
def window_to_next_group(qtile):
    current_group = qtile.groups.index(qtile.current_group)
    new_group = current_group + 1 if current_group != 9 else 0
    if qtile.current_window is not None:
        qtile.current_window.togroup(qtile.groups[new_group].name)
        qtile.current_screen.toggle_group(qtile.groups[new_group])

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod],
            i.name,
            lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # Use mod1 + Page_Down/Page_Up to move between groups
        Key([mod], "Page_Down", lazy.screen.next_group(),
             desc="Switch to next group"),

        Key([mod], "Page_Up", lazy.screen.prev_group(),
            desc="Switch to previous group"),

        # Use mod1 + shift + Page_Down/Page_Up to move a window between groups
        Key([mod, "shift"], "Page_Down", window_to_next_group(),
            desc="Move window to next group"),
      
        Key([mod, "shift"], "Page_Up", window_to_prev_group(),
            desc="Move window to previous group"),

        # Use mod1 + Home/End to move to first/last group
        Key([mod], "Home", lazy.group["1"].toscreen(),
            desc="Switch to first group"),

        Key([mod], "End", lazy.group["0"].toscreen(),
            desc="Switch to last group"),

        # Use mod1 + shift + Home/End to move windows to first/last group
        Key([mod, "shift"], "Home",
            lazy.window.togroup("1", switch_group=True),
            desc="Switch to & move focused window to first group"),
        
        Key([mod, "shift"], "End",
            lazy.window.togroup("0", switch_group=True),
            desc="Switch to & move focused window to last group"),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"],
            i.name,
            lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])
