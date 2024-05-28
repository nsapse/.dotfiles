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
-- g.termguicolors = true

g.foldmethod = 'expr'
o.foldcolumn = '1' -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true



g.foldexpr = 'nvim_treesitter#foldexpr()'

-- cmd.colorscheme('gruvbox-material')
-- cmd.colorscheme('base16-everforest')
cmd.colorscheme('gruvbox-material')
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
g.ignorecase = true


-- Search
--o.nohlsearch = true
-- o.incsearch = true

-- Backup
o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = '/home/noah/.config/nvim/undodir/'
if vim.fn.has('macunix') then
    o.undodir = '/Users/noah.sapse/undodir'
end


-- Conceal
o.cocu = "vnc"
o.conceallevel = 0

-- Plugins
-- Arduino
require("configuration.misc")
-- require("configuration.treesitter")
require("configuration.dap")
