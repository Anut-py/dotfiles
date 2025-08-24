local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = {}

config.default_prog = { "bash" }
config.audible_bell = "Disabled"
config.harfbuzz_features = { "calt=0" }

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
