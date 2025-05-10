local wezterm = require("wezterm")
local commands = require("commands")

local config = wezterm.config_builder()

-- Font settings
config.font_size = 14
config.line_height = 1.2
config.font = wezterm.font("MesloLGS NF")

-- Colors
config.color_scheme = "Pnevma"
--config.color_scheme = "Poimandres"

-- Appearence
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.macos_window_background_blur = 40

-- Misc
config.max_fps = 120
config.prefer_egl = true

-- Custom commands
wezterm.on("augment-command-pallete", function()
  return commands
end) -- Not working

return config
