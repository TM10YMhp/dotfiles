local wezterm = require("wezterm") --[[@as Wezterm]]

wezterm.on("gui-startup", function()
  ---@type MuxTabObj, Pane, MuxWindow
  local _, _, _ = wezterm.mux.spawn_window({
    width = 105,
    height = 84,
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
config.keys = {
  {
    key = " ",
    mods = "CTRL",
    action = act.SendKey({
      key = " ",
      mods = "CTRL",
    }),
  },
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
config.inactive_pane_hsb = {}

config.font = wezterm.font("Lexis")
config.font_size = 6
-- config.freetype_load_target = "Mono"

config.cursor_blink_rate = 0

config.enable_scroll_bar = true
config.window_padding = {
  left = 3,
  right = 7,
  top = 0,
  bottom = 0,
}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 1.0
config.use_fancy_tab_bar = false
config.front_end = "Software"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.bold_brightens_ansi_colors = false

return config
