from libqtile import widget
from libqtile import qtile
from datetime import datetime, timedelta
import os

colors = [
	      ["#282c34", "#282c34"], # panel background
          ["#3d3f4b", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#74438f", "#74438f"], # border line color for 'other tabs' and color for 'odd widgets'
          ["#4f76c7", "#4f76c7"], # color for the 'even widgets'
          ["#e1acff", "#e1acff"], # window name
          ["#ecbbfb", "#ecbbfb"]  # backbround for inactive screens
] 


widget_defaults = dict(
    font='Cantarell',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()
class MyVolume(widget.Volume):
    def _configure(self, qtile, bar):
        widget.Volume._configure(self, qtile, bar)
        self.volume = self.get_volume()
        if self.volume <= 0:
            self.text = '󰆪'
        elif self.volume <= 15:
            self.text = ''
        elif self.volume < 50:
            self.text = ''
        else:
            self.text = ''
        # drawing here crashes Wayland

    def _update_drawer(self, wob=False):
        if self.volume <= 0:
            self.text = '󰆪'
        elif self.volume <= 15:
            self.text = ''
        elif self.volume < 50:
            self.text = ''
        else:
            self.text = ''
        self.draw()

        if wob:
            with open(self.wob, 'a') as f:
                f.write(str(self.volume) + "\n")

volume = MyVolume(
    fontsize=18,
    font='Font Awesome 5 Free',
    foreground=colors[4],
    background='#2f343f',
    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")}
)

class MyPomodoro(widget.Pomodoro):
    def _update(self):
        if self.status in [self.STATUS_INACTIVE, self.STATUS_PAUSED]:
            return

        if self.end_time > datetime.now() and self.status != self.STATUS_START:
            return

            if self.status == self.STATUS_ACTIVE and self.pomodoros == self.num_pomodori:
                self.status = self.STATUS_LONG_BREAK
                self.end_time = datetime.now() + timedelta(minutes=self.length_long_break)
                self.pomodoros = 1
            if self.notification_on:
                self._send_notification(
                    "normal",
                    "Long break!",
                )
                # For some reason this doesn't work using lazy.spawn() or any other fancy qtile function
                os.system(f"python ~/.config/qtile/scripts/pomodoro_alert.py {self.length_long_break*60}")
            return

        if self.status == self.STATUS_ACTIVE:
            self.status = self.STATUS_BREAK
            self.end_time = datetime.now() + timedelta(minutes=self.length_short_break)
            self.pomodoros += 1
            if self.notification_on:
                self._send_notification(
                    "normal",
                    "Short break!",
                )
                os.system(f"python ~/.config/qtile/scripts/pomodoro_alert.py {self.length_short_break*60}")
            return

        self.status = self.STATUS_ACTIVE
        self.end_time = datetime.now() + timedelta(minutes=self.length_pomodori)
        if self.notification_on:
            self._send_notification(
                "critical",
                "Please start with the next Pomodori",
            )

        return

pomodoro = MyPomodoro(
    color_active='#9bd689',
    color_break='#e39378',
    length_long_break=5,
    length_short_break=2,
    length_pomodori=15
)
