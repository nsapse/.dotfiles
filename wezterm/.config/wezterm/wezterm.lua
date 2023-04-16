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
config.color_scheme = 'Nord (base16)'

config.leader = { key = '\\', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '[',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = ']',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}
-- config.color_scheme = 'Gruvbox dark, soft (base16)'

-- and finally, return the configuration to wezterm
return config

