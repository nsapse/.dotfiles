-- setting some local namespace variables to simplify writing

local o = vim.o
local wo = vim.wo
local bo = vim.bo

------------------------
-- ~~Global Options~~ --
------------------------

-- Window Appearance
o.nu = true
o.rnu = true
o.termguicolors = true

-- General UI/UX
o.showmatch = true
o.encoding = 'UTF-8'

-- Tab and Shift
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

-- Syntax, Indent, and Case
o.smartindent = true
o.smartcase = true

-- Search
--o.nohlsearch = true
o.incsearch = true

-- Backup
--o.noswapfile = true
--o.nobackup = true
--o.undofile = true
--o.undodir = '~/.vim/undodir'

-- Conceal
o.cocu = 'vnic'
