import time
import tkinter as tk
import sys
import json
from pomodoro_alert import show_notification
config_path = "pomodoro_config.json"

defaults = dict()

def main():
    load_config()

    root = tk.Tk()
    root.title("Pomodoro")

    lblPomodori = tk.Label(
        root,
        text="Pomodori:"
    ).pack()
    txtPomodori = tk.Entry(
        root,
        textvariable=tk.StringVar(value=defaults['pomodori'])
    ).pack()
    lblShortBreak = tk.Label(
        root,
        text="Short break:",
    ).pack()
    txtShortBreak = tk.Entry(
        root,
        textvariable=tk.StringVar(value=defaults['short_break'])
    ).pack()
    lblLongBreak = tk.Label(
        root,
        text="Long break:",
    ).pack()
    txtLongBreak = tk.Entry(
        root,
        textvariable=tk.StringVar(value=defaults['long_break'])
    ).pack()
    lblRows = tk.Label(
        root,
        text="Rows:",
    ).pack()
    txtRows = tk.Entry(
        root,
        textvariable=tk.StringVar(value=defaults['rows'])
    ).pack()
    btnStart = tk.Button(
        root,
        text="Start",
        command=play
    ).pack()

    root.mainloop()

def load_config():
    with open(config_path, "r") as json_file:
        global defaults
        defaults = json.load(json_file)


def save_config():
    with open(config_path, "w") as json_file:
        json.dump(defaults, json_file)


def play():
    save_config()

    row = 1
    while True:
        # wait 1 pomodori
        wait(defaults['pomodori'])

        if row == defaults['rows']:
            # long break
            wait(defaults['long_break'], is_break=True)
            row = 1
        else:
            # short break
            wait(defaults['short_break'], is_break=True)
            row += 1

def wait(minutes, is_break=False):
    seconds = int(float(minutes)*60)
    if is_break:
        show_notification(seconds)
    else:
        wait_end = time.time() + seconds
        while time.time() < wait_end:
            pass # put here logic for pausing and quiting


if __name__ == "__main__":
    main()
