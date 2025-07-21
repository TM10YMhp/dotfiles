---@type Wezterm
local wezterm = require("wezterm")

wezterm.on("gui-startup", function()
  ---@type MuxTabObj, Pane, MuxWindow
  local _, _, _ = wezterm.mux.spawn_window({
    width = 105,
    height = 81,
    position = {
      x = 633,
      y = 0,
    },
  })
end)

local config = wezterm.config_builder()

local act = wezterm.action
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "NONE",
    action = act.Nop,
  },
  -- {
  --   event = { Up = { streak = 1, button = "Left" } },
  --   mods = "CTRL",
  --   action = act.OpenLinkAtMouseCursor,
  -- },
}

-- config.color_scheme = "Builtin Dark"
-- config.color_scheme = "Brogrammer (Gogh)"
config.color_scheme = "Argonaut"
-- config.color_scheme = "serene"

config.colors = {
  background = "#000000",
  foreground = "#ffffff",
  cursor_bg = "#ffffff",
  cursor_fg = "#000000",
  cursor_border = "#52ad70",
}

config.font = wezterm.font("Lexis")
config.freetype_load_target = "Mono"
config.enable_scroll_bar = true
config.window_padding = {
  left = 4,
  right = 8,
  top = 4,
  bottom = 4,
}
config.font_size = 6
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 1.0
config.use_fancy_tab_bar = true
config.front_end = "Software"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

return config
