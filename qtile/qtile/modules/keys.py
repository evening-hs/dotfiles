from libqtile.lazy import lazy
from libqtile.config import Key

mod = "mod4"
terminal = "xfce4-terminal"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    # Move between open windows
    Key([mod], "space",lazy.layout.next(),
        desc="Move window focus to other window"),

    # Bring windows forward/backwards
    Key([mod], "f",lazy.window.bring_to_front(),desc="Brings a window to the front"),

    # Launchers
    # Launch terminal
    Key([mod], "Return", lazy.spawn(terminal),
        desc="Launch terminal"),
    # Launch rofi
    Key([mod], "tab", lazy.spawn("rofi -show combi"),
        desc="spawn rofi"),
    Key([mod, "shift"], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(),
        desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow(),
        desc="Grow window"),
    Key([mod, "control"], "l", lazy.layout.shrink(),
        desc="Shrink window"),
    Key([mod], "n", lazy.layout.normalize(),
        desc="Reset all window sizes"),

    # Make windows floating or fullscreen
    Key([mod, "shift"], "m", lazy.window.toggle_fullscreen(),
        desc="Toggle window fullscreen"),
    Key([mod], "m", lazy.window.toggle_floating(),
        desc="Toggle window floating"),

    # Toggle between different layouts as defined below
    Key([mod], "r", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),
    Key([mod, "shift"], "space", lazy.layout.flip()),

    # Qtile WM
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Manage audio and volume
    Key([], "XF86AudioRaiseVolume",lazy.spawn("amixer set Master 2%+")),
    Key([], "XF86AudioLowerVolume",lazy.spawn("amixer set Master 2%-")),
    Key([], "XF86AudioMute",lazy.spawn("amixer set Master toggle")),

    # Manage Brightness
    Key([], "XF86MonBrightnessUp",lazy.spawn("brightnessctl s 5%+")),
    Key([], "XF86MonBrightnessDown",lazy.spawn("brightnessctl s 5%-")),

    # Launch screenshot utility
    Key([], "Print",lazy.spawn("gnome-screenshot")),
    Key([mod], "Print",lazy.spawn("gnome-screenshot -i")),
]
