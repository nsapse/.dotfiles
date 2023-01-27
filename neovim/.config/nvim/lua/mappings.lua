local g = vim.g
local vk = vim.keymap
local cmd = vim.cmd

--leaders
g.mapleader = " "
g.maplocalleader = "\\"

--allow quick file sourcing
vk.set({'n'}, '<leader>so', ':so %<CR>')

--extending capital motions
vk.set('n', 'Y', 'y$')
vk.set('n', 'V', 'v$')
vk.set('n', 'J', 'mzJ`z')

-- quickly open config files
local telescope = require("telescope.builtin")
vk.set('n', '<leader>ec', function() cmd.vsplit("$MYVIMRC") end)
vk.set('n', '<leader>elc', function() telescope.find_files({cwd='~/.config/nvim/lua'}) end)

--window commands
vk.set('n', '<leader>wc', function() cmd.wincmd('c') end, {silent=true})
vk.set('n', '<C-c>', function() cmd.wincmd('c') end, {silent=true})

vk.set('n', '<C-h>', function() cmd.wincmd('h') end, {silent=true})
vk.set('n', '<C-j>', function() cmd.wincmd('j') end, {silent=true})
vk.set('n', '<C-k>', function() cmd.wincmd('k') end, {silent=true})
vk.set('n', '<C-l>', function() cmd.wincmd('l') end, {silent=true})

vk.set('n', '<leader>wh', function() cmd.wincmd('h') end, {silent=true})
vk.set('n', '<leader>wj', function() cmd.wincmd('j') end, {silent=true})
vk.set('n', '<leader>wk', function() cmd.wincmd('k') end, {silent=true})
vk.set('n', '<leader>wl', function() cmd.wincmd('l') end, {silent=true})

-- window and tab navigation
vk.set({'n', 'v'}, '<leader>tt', function() cmd.tabnew() end, {silent=true})
vk.set({'n', 'v'}, '<leader>tc', function() cmd.tabclose() end, {silent=true})
vk.set({'n'}, 'TN', function() cmd.tabnext() end, {silent=true})
vk.set({'n'}, 'TP', function() cmd.tabprevious() end, {silent=true})

-- quickly move lines up or down
vk.set('n', '<C-K>', ':m .+1<cr>', {silent=true})
vk.set('n', '<C-J>', ':m .-2<cr>', {silent=true})

-- add "traditional" save and quit bindings
vk.set({'i', 'n', 'v'}, "<c-s>", function() cmd.w() end)
vk.set({'i', 'n', 'v'}, "<c-q>", function() cmd.qa() end)

-- automatically center on location jumps
vk.set('n', '<c-o>', '<c-o>zz')
vk.set('n', '<c-i>', '<c-i>zz')
vk.set('n', '<c-u>', '<c-u>zz')
vk.set('n', '<c-d>', '<c-d>zz')

