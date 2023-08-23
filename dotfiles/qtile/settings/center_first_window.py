from libqtile import hook
from libqtile.config import Key, Screen
from libqtile.lazy import lazy



# Center the first window on the screen and set its width and height to 80% of the screen
@hook.subscribe.client_new
def center_window(window):
    if len(window.qtile.current_screen.group.windows) == 0:
        window.floating = True
        screen = window.qtile.current_screen
        window.width = int(screen.width * 0.8)
        window.height = int(screen.height * 0.8)
        window.x = int(screen.width * 0.1)
        window.y = int(screen.height * 0.1)
        window.cmd_bring_to_front()
