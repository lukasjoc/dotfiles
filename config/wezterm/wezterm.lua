local wez = require("wezterm")

local font = wez.font_with_fallback({"Hack", "monospace"})

return {
    font   = font,
    color_scheme = "Tango (terminal.sexy)",
    enable_tab_bar = false,
}
