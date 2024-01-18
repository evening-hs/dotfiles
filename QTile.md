# QTile

**Current version**

![](/home/huerta/dotfiles/images/qtile.png)

![](/home/huerta/dotfiles/images/qtile-2.png)

**Previous version**

[commit a3346a6670981e7abc4830e0efd1a77b97681d77](https://github.com/Gspr-bit/dotfiles/tree/a3346a6670981e7abc4830e0efd1a77b97681d77)

![](/home/huerta/dotfiles/images/qtile-translucent.png)

## Dependencies

```
qtile rofi kitty picom ibus nemo amixer brightnessctl gnome-screenshot light-locker touchegg dunst feh nm-applet tkinter
```

:warning: I might have forgotten some dependencies. If something doesn't work, please check if a missing package could be the reason. Please check the README file on how to install these dependencies.

:warning: QTile doesn't fully supports Wayland, but this configuration works, with some lacking characteristics. You might need to install additional dependencies to run it on Wayland.

## Shortcuts

### Workspace (group) shortcuts

| Shortcut                                             | Action                                 |
| ---------------------------------------------------- | -------------------------------------- |
| <kbd>Super</kbd>+<kbd>i</kbd>                        | Switch to group i.                     |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>i</kbd>       | Move current window to group i.        |
| <kbd>Super</kbd>+<kbd>Pg Down</kbd>                  | Switch to next group.                  |
| <kbd>Super</kbd>+<kbd>Pg Up</kbd>                    | Switch to previous group.              |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Pg Down</kbd> | Move current window to next group.     |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Pg Up</kbd>   | Move current window to previous group. |
| <kbd>Super</kbd>+<kbd>Home</kbd>                     | Switch to first group.                 |
| <kbd>Super</kbd>+<kbd>End</kbd>                      | Switch to last group.                  |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Home</kbd>    | Move current window to first group.    |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>End</kbd>     | Move current window to last group.     |

### Window focus and position

| Shortcut                                                     | Action                  |
| ------------------------------------------------------------ | ----------------------- |
| <kbd>Super</kbd>+<kbd>H</kbd> / <kbd>Super</kbd>+<kbd>Left</kbd> | Move focus to the left. |
| <kbd>Super</kbd>+<kbd>L</kbd> / <kbd>Super</kbd>+<kbd>Right</kbd> | Move focus to the right. |
| <kbd>Super</kbd>+<kbd>J</kbd> / <kbd>Super</kbd>+<kbd>Down</kbd> | Move focus down. |
| <kbd>Super</kbd>+<kbd>K</kbd> / <kbd>Super</kbd>+<kbd>Up</kbd> | Move focus up. |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>H</kbd> / <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Left</kbd> | Move window to the left. |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>L</kbd> / <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Right</kbd> | Move window to the right. |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>J</kbd> / <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Down</kbd> | Move window down. |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>K</kbd> / <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Up</kbd> | Move window up. |
| <kbd>Super</kbd>+<kbd>Ctrl</kbd>+<kbd>H</kbd> / <kbd>Super</kbd>+<kbd>Ctrl</kbd>+<kbd>Left</kbd> | Grow window to the left. |
| <kbd>Super</kbd>+<kbd>Ctrl</kbd>+<kbd>L</kbd> / <kbd>Super</kbd>+<kbd>Ctrl</kbd>+<kbd>Right</kbd> | Grow window to the right. |
| <kbd>Super</kbd>+<kbd>Ctrl</kbd>+<kbd>J</kbd> / <kbd>Super</kbd>+<kbd>Ctrl</kbd>+<kbd>Down</kbd> | Grow window down. |
| <kbd>Super</kbd>+<kbd>Ctrl</kbd>+<kbd>K</kbd> / <kbd>Super</kbd>+<kbd>Ctrl</kbd>+<kbd>Up</kbd> | Grow window up. |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Ctrl</kbd>+<kbd>H</kbd> | Swap column to the left. |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Ctrl</kbd>+<kbd>L</kbd> | Swap column to the right. |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>Space</kbd> | Toggle window split. |
| <kbd>Super</kbd>+<kbd>R</kbd> | Toggle between layouts (BSP, Max, Floating). |
| <kbd>Super</kbd>+<kbd>F</kbd> | Bring window forwards. |
| <kbd>Super</kbd>+<kbd>N</kbd> | Reset windows positions and sizes. |
| <kbd>Super</kbd>+<kbd>M</kbd> | Toggle window floating. |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>M</kbd> | Toggle window fullscreen. |
| <kbd>Super</kbd>+<kbd>Q</kbd> | Close window. |

### Launching apps

| Shortcut                                       | Action                     |
| ---------------------------------------------- | -------------------------- |
| <kbd>Super</kbd>+<kbd>Tab</kbd>                | Launch rofi.               |
| <kbd>Super</kbd>+<kbd>F</kbd>                  | Launch the file manager.   |
| <kbd>Super</kbd>+<kbd>Return</kbd>             | Launch a terminal.         |
| <kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>R</kbd> | Launch a prompt widget.    |
| <kbd>Raise Volume</kbd>                        | Raise volume.              |
| <kbd>Lower Volume</kbd>                        | Lower volume.              |
| <kbd>Mute Volume</kbd>                         | Mute volume.               |
| <kbd>Brightness Up</kbd>                       | Raise brightness.          |
| <kbd>Brightness Down</kbd>                     | Lower Brightness.          |
| <kbd>Print</kbd>                               | Take screenshot.           |
| <kbd>Super</kbd>+<kbd>Print</kbd>              | Launch `gnome-screenshot`. |
| <kbd>Super</kbd>+<kbd>Escape</kbd>             | Lock screen.               |

