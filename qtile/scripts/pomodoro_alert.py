import time
import tkinter as tk
import sys

def main(duration):
    # Create a fullscreen black window
    root = tk.Tk()
    
    root.title("Pomodoro")

    root.wait_visibility(root)

    root.wm_attributes("-fullscreen", True),
    root.wm_attributes("-topmost", True)
    root.wm_attributes("-alpha", 0.85)

    root.configure(background='black')

    # Create a timer
    timer = time.time() + duration

    def on_clic(_):
        root.destroy()

    root.bind('<Button-1>', on_clic)

    def update_timer():
        if time.time() < timer:
            remaining_time = int(timer - time.time())
            text = f"{remaining_time//60}:{remaining_time%60:02}"
            label.config(text=text)
            
            root.after(1000, update_timer)
        else:
            root.destroy()


    label = tk.Label(
            root,
            text="",
            font=('Cascadia Code', 75),
            fg="white",
            bg="black")

    label.place(relx=0.5, rely=0.5, anchor='center')

    update_timer()
    root.mainloop()
    

if __name__ == "__main__":
    main(int(sys.argv[1]))
