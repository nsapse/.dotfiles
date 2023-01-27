local map = vim.api.nvim_set_keymap
local g = vim.g
local vk = vim.keymap

--leaders
g.mapleader = " "
g.maplocalleader = "\\"

--extending capital motions
vk.set('n', 'Y', 'y$')
vk.set('n', 'V', 'v$')
vk.set('n', 'J', 'mzJ`z')

-- quickly open config files
