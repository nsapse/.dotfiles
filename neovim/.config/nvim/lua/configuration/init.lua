-- setting some local namespace variables to simplify writing

local o = vim.o
local g = vim.g
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd
------------------------
-- ~~Global Options~~ --
------------------------

-- Window Appearance
o.nu = true
o.rnu = true
-- o.termguicolors = true
o.cursorline = true
o.laststatus = 3
o.title = true
o.colorcolumn = "80"
o.list = true
o.foldenable = false
-- g.termguicolors = true

g.everforest_background = 'soft'
g.everforest_better_performance = 1

cmd.colorscheme('nordfox')
-- g.titlestring = %{hostname()}\ \ %F\ \ %{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

-- General UI/UX
o.showmatch = true
o.encoding = "UTF-8"

-- Tab and Shift
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- Syntax, Indent, and Case
o.smartindent = true
o.smartcase = true
g.Syntax = true
g.nohlsearch = true


-- Search
--o.nohlsearch = true
-- o.incsearch = true

-- Backup
o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = '/home/noah/.config/nvim/undodir/'

-- Conceal
o.cocu = "vnic"

-- Plugins
-- Arduino
require("configuration.misc")
require("configuration.treesitter")
require("configuration.dap")
