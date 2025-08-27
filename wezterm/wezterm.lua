local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

local config = wezterm.config_builder()

config.default_prog = { "zsh" }
config.audible_bell = "Disabled"
config.harfbuzz_features = { "calt=0" }
config.color_scheme = "Catppuccin Mocha"
config.font_size = 10.0
config.leader = { key = ' ', mods = 'CTRL' }

config.keys = {
    {
        key = 'h',
        mods = 'LEADER',
        action = act.SplitPane {
            direction = 'Left',
            size = { Percent = 50 },
        },
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = act.SplitPane {
            direction = 'Right',
            size = { Percent = 50 },
        },
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = act.SplitPane {
            direction = 'Down',
            size = { Percent = 30 },
        },
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = act.SplitPane {
            direction = 'Up',
            size = { Percent = 30 },
        },
    },
    {
        key = 'c',
        mods = 'LEADER',
        action = act.CloseCurrentPane { confirm = true },
    },
    {
        key = 'y',
        mods = 'LEADER',
        action = act.SwitchToWorkspace {
            name = 'default',
        },
    },
    {
        key = '9',
        mods = 'LEADER',
        action = act.ShowLauncherArgs {
            flags = 'FUZZY|WORKSPACES',
        },
    },
}

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

wezterm.on('update-right-status', function(window, _)
      window:set_right_status(window:active_workspace())
end)

local smart_splits =
    wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
smart_splits.apply_to_config(config, {
  direction_keys = { 'h', 'j', 'k', 'l' },
  modifiers = {
    move = 'META',
    resize = 'META | CTRL',
  },
  log_level = 'info',
})

return config
