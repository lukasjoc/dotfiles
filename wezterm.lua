local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end
config.enable_scroll_bar = false
config.font_size = 9.0
config.tab_bar_at_bottom = true
config.audible_bell = "Disabled"
config.enable_scroll_bar = false
config.enable_wayland = false
config.exit_behavior = "Close"
config.scrollback_lines = 10000
config.enable_tab_bar = false
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 0,
}
return config
