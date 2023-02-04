local g = vim.g
local map = vim.keymap
local cmd = vim.cmd

--leaders
--allow quick file sourcing
map.set({'n'}, '<leader>so', ':so %<CR>')

--extending capital motions
map.set('n', 'Y', 'y$')
map.set('n', 'V', 'v$')
map.set('n', 'J', 'mzJ`z')

-- quickly open config files
local telescope = require("telescope.builtin")
map.set('n', '<leader>ec', function() cmd.vsplit("$MYVIMRC") end)
map.set('n', '<leader>oc', function() telescope.find_files({cwd='~/.config/nvim/lua'}) end)

--window commands
map.set('n', '<leader>wc', function() cmd.wincmd('c') end, {silent=true})
map.set('n', '<C-c>', function() cmd.wincmd('c') end, {silent=true})

map.set('n', '<C-h>', function() cmd.wincmd('h') end, {silent=true})
map.set('n', '<C-j>', function() cmd.wincmd('j') end, {silent=true})
map.set('n', '<C-k>', function() cmd.wincmd('k') end, {silent=true})
map.set('n', '<C-l>', function() cmd.wincmd('l') end, {silent=true})

map.set('n', '<leader>wh', function() cmd.wincmd('h') end, {silent=true})
map.set('n', '<leader>wj', function() cmd.wincmd('j') end, {silent=true})
map.set('n', '<leader>wk', function() cmd.wincmd('k') end, {silent=true})
map.set('n', '<leader>wl', function() cmd.wincmd('l') end, {silent=true})

-- window and tab navigation
map.set({'n', 'v'}, '<leader>tt', function() cmd.tabnew() end, {silent=true})
map.set({'n', 'v'}, '<leader>tc', function() cmd.tabclose() end, {silent=true})
map.set({'n'}, 'TN', function() cmd.tabnext() end, {silent=true})
map.set({'n'}, 'TP', function() cmd.tabprevious() end, {silent=true})

-- quickly move lines up or down
map.set('n', '<C-KK>', ':m .+1<cr>', {silent=true})
map.set('n', '<C-JJ>', ':m .-2<cr>', {silent=true})

-- add "traditional" save and quit bindings
map.set({'i', 'n', 'v'}, "<c-s>", vim.cmd.w)
map.set({'i', 'n', 'v'}, "<c-q>", vim.cmd.qa)

-- automatically center on location jumps
map.set('n', '<c-o>', '<c-o>zz')
map.set('n', '<c-i>', '<c-i>zz')
map.set('n', '<c-u>', '<c-u>zz')
map.set('n', '<c-d>', '<c-d>zz')

-- allow yank/paste to/from system clipboard on <leader>y/p
map.set({'n','v'}, '<leader>y', "\"+y")
map.set({'n','v'}, '<leader>p', "\"+p")

-- quickfix navigation
map.set('n', 'qn', ':cn<cr>')
map.set('n', 'qp', ':cp<cr>')

-- telescope
require("mappings.telescope")
require("mappings.treesitter")
require("mappings.misc")
require("mappings.dap")
