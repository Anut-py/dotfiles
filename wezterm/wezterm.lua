local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

local config = wezterm.config_builder()

config.default_prog = { "zsh" }
config.audible_bell = "Disabled"
config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 50,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 50,
}
config.harfbuzz_features = { "calt=0" }
config.color_scheme = "Catppuccin Mocha"
config.font_size = 8.0
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
        key = 'w',
        mods = 'LEADER',
        action = act.ShowLauncherArgs {
            flags = 'FUZZY|WORKSPACES',
        },
    },
    {
        key = 'n',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = wezterm.format {
                { Attribute = { Intensity = 'Bold' } },
                { Foreground = { AnsiColor = 'Fuchsia' } },
                { Text = 'Enter name for new workspace' },
            },
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:perform_action(
                        act.SwitchToWorkspace {
                            name = line,
                        },
                        pane
                    )
                end
            end),
        },
    },
    {
        key = 'z',
        mods = 'LEADER',
        action = act.TogglePaneZoomState,
    },
    {
        key = ' ',
        mods = 'CTRL|LEADER',
        action = act.SendKey({ key = ' ', mods = 'CTRL' })
    }
}

local shifts = { ")", "!", "@", "#", "$", "%", "^", "&", "*", "(" }
for i=1,9 do
    table.insert(config.keys, {
      key = tostring(i),
      mods = 'SUPER',
      action = act.SendKey({ key = tostring(i), mods = 'SUPER' }),
    })
    table.insert(config.keys, {
      key = tostring(i),
      mods = 'SHIFT|CTRL',
      action = act.SendKey({ key = tostring(i), mods = 'SHIFT|CTRL' }),
    })
    table.insert(config.keys, {
      key = shifts[i],
      mods = 'CTRL',
      action = act.SendKey({ key = shifts[i], mods = 'CTRL' }),
    })
    table.insert(config.keys, {
      key = shifts[i],
      mods = 'SHIFT|CTRL',
      action = act.SendKey({ key = shifts[i], mods = 'SHIFT|CTRL' }),
    })
end

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
