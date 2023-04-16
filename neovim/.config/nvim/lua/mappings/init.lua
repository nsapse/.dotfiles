local g = vim.g
local map = vim.keymap.set
local cmd = vim.cmd

--leaders
--allow quick file sourcing
map({'n'}, '<leader>so', ':so %<CR>')

--extending capital motions
map('n', 'Y', 'y$')
map('n', 'V', 'v$')
map('n', 'J', 'mzJ`z')

-- quickly open config files
local telescope = require("telescope.builtin")
map('n', '<leader>ec', function() cmd.vsplit("$MYVIMRC") end)
map('n', '<leader>oc', function() telescope.find_files({cwd='~/.config/nvim/lua'}) end)
map('n', '<leader>ftc', function() telescope.find_files({cwd='~/.config/nvim/ftplugin/'}) end)

--window commands
map('n', '<leader>wc', function() cmd.wincmd('c') end, {silent=true})
map('n', '<C-c>', function() cmd.wincmd('c') end, {silent=true})

map('n', '<C-h>', function() cmd.wincmd('h') end, {silent=true})
map('n', '<C-j>', function() cmd.wincmd('j') end, {silent=true})
map('n', '<C-k>', function() cmd.wincmd('k') end, {silent=true})
map('n', '<C-l>', function() cmd.wincmd('l') end, {silent=true})

map('n', '<leader>wh', function() cmd.wincmd('h') end, {silent=true})
map('n', '<leader>wj', function() cmd.wincmd('j') end, {silent=true})
map('n', '<leader>wk', function() cmd.wincmd('k') end, {silent=true})
map('n', '<leader>wl', function() cmd.wincmd('l') end, {silent=true})

-- window and tab navigation
map({'n', 'v'}, '<leader>tt', function() cmd.tabnew() end, {silent=true})
map({'n', 'v'}, '<leader>tc', function() cmd.tabclose() end, {silent=true})
map({'n'}, 'TN', function() cmd.tabnext() end, {silent=true})
map({'n'}, 'TP', function() cmd.tabprevious() end, {silent=true})
map({'n'}, 'TC', function() cmd.tabclose() end, {silent=true})

-- quickly move lines up or down
map('n', '<C-KK>', ':m .+1<cr>', {silent=true})
map('n', '<C-JJ>', ':m .-2<cr>', {silent=true})

-- add "traditional" save and quit bindings
map({'i', 'n', 'v'}, "<c-s>", vim.cmd.w)
map({'i', 'n', 'v'}, "<c-q>", vim.cmd.qa)

-- automatically center on location jumps
map('n', '<c-o>', '<c-o>zz')
map('n', '<c-i>', '<c-i>zz')
map('n', '<c-u>', '<c-u>zz')
map('n', '<c-d>', '<c-d>zz')

-- allow yank/paste to/from system clipboard on <leader>y/p
map({'n','v'}, '<leader>y', "\"+y")
map({'n','v'}, '<leader>p', "\"+p")

-- quickfix navigation
map('n', 'qn', ':cn<cr>')
map('n', 'qp', ':cp<cr>')

-- telescope
require("mappings.telescope")
require("mappings.treesitter")
require("mappings.misc")
require("mappings.dap")
