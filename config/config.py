# QTile Config

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = False
wl_input_rules = None
wmname = "qtile"
terminal = guess_terminal()

mod = "mod4"
modShift = [mod, "shift"]
modControl = [mod, "control"]

TOP_BAR_HEIGHT=20
BOTTOM_BAR_HEIGHT=18

keys = [
    Key([mod], "l", lazy.layout.next(), desc="Move window focus to other window"),
    Key(modShift, "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(modShift, "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key(modShift, "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key(modShift, "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.spawn("firefox"), desc="Launch firefox"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch a terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(modControl, "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(modControl, "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "space", lazy.spawn("rofi -show run"),
        desc="Spawn a command using dmenu in the prompt"),
]

WORKSPACE_COUNT=10
workspaces = [
    Group(workspace_id)
    for workspace_id in "".join([str(_) for _ in range(1, WORKSPACE_COUNT + 1)])
]
for workspace in workspaces:
    keys.extend(
        [
            Key(
                [mod],
                workspace.name,
                lazy.group[workspace.name].toscreen(),
                desc=f"Switch to workspace {workspace.name}",
            ),
            Key(
                modShift,
                workspace.name,
                lazy.window.togroup(workspace.name, switch_group=True),
                desc=f"Switch to and move focused window to workspace {workspace.name}",
            ),
        ]
    )

layouts = [
    layout.Max(),
    layout.Columns(
        border_focus=["#6496C8"],
        border_width=5,
        margin=2,
    ),
    # layout.MonadThreeCol(),
]

widget_defaults = dict(font="sans", fontsize=16, padding=4)
extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(hide_unused=True),
                widget.Prompt(),
                widget.WindowName(),
            ],
            TOP_BAR_HEIGHT,
        ),
        bottom=bar.Bar(
            [
                widget.Systray(),
                widget.Clock(format="%A %d.%m.%Y (%T)", timezone="Europe/Berlin"),
                widget.CPU(
                    format="| CPU {freq_current}GHz {load_percent}%",
                    update_interval=10.0,
                ),
                widget.Memory(
                    format="| Swap: {SwapUsed: .0f}{ms}/{SwapTotal: .0f}{ms}",
                    measure_mem="G",
                    measure_swap="G",
                    update_interval=10.0,
                ),
                widget.Net(
                    format="| Network: (↑{up})( (↓{down})",
                    update_interval=10.0),
            ],
            BOTTOM_BAR_HEIGHT,
        ),
    ),
]

