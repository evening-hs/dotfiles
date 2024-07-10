import time
import sys
import json
import threading
from plyer import notification

from pomodoro_alert import show_notification

config_path = "pomodoro_config.json"

defaults = dict()

def main():
    load_config()
    log("Starting pomodoro")
    thread = threading.Thread(target=play)
    thread.start()

def load_config():
    with open(config_path, "r") as json_file:
        global defaults
        defaults = json.load(json_file)

def log(msg):
    now = time.localtime()
    hour = now.tm_hour
    minute = now.tm_min
    print(f"{hour:02}:{minute:02} - {msg}")

def play():
    row = 1
    while True:
        # wait 1 pomodori
        log("Pomodori started")
        wait(defaults['pomodori'])

        if row == defaults['rows']:
            # long break
            log("Long break started")
            wait(defaults['long_break'], is_break=True)
            row = 1
        else:
            # short break
            log("Short break started")
            wait(defaults['short_break'], is_break=True)
            row += 1

def wait(minutes, is_break=False):
    seconds = int(float(minutes)*60)

    if is_break:
        thread = threading.Thread(target=show_notification, args=(seconds,))
        thread.start()

    wait_end = time.time() + seconds
    notif_send = False
    while time.time() < wait_end:
        if wait_end - time.time() <= 15 and not is_break and not notif_send:
            notification.notify(title="Pomodoro",
                                message="30 seconds remaining for break",
                                timeout=30)
            notif_send = True


if __name__ == "__main__":
    main()
