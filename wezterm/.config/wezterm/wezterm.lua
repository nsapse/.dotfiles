-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}


-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Set colorscheme
-- config.color_scheme = 'Everforest Dark (Gogh)'
config.color_scheme = 'nordfox'
-- config.color_scheme = 'Gruvbox dark, soft (base16)'
-- config.color_scheme = 'Gruvbox dark, pale (base16)'
-- config.color_scheme = 'Gruvbox Material (Gogh)'
-- config.color_scheme = 'N0tch2k'

-- config.color_scheme = 'Material (base16)'

config.font_size= 14
-- config.color_scheme = 'nordfox'
-- config.disable_default_key_bindings = true
config.audible_bell = "Disabled"
config.check_for_updates = false

-- Set Leader to CTRL+SPACE
config.leader = { key = ' ', mods = 'SHIFT', timeout_milliseconds = 1000 }
local act = wezterm.action
config.keys = {
  {
    key = 'o',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'O',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane{ confirm = true },
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = 'r',
    mods = 'LEADER',
    action = wezterm.action.ReloadConfiguration,
  },
  {
    key = 'h',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = act.ActivatePaneDirection 'Down',
  },
}

-- and finally, return the configuration to wezterm
return config

