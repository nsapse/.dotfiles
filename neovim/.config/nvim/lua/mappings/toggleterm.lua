local Terminal  = require('toggleterm.terminal').Terminal

-- function to run on opening the terminal
local on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end

-- function to run on closing the terminal
local on_close = function(term)
    vim.cmd("startinsert!")
    end

-- toggleterm operations
local lazygit = Terminal:new({ cmd="lazygit", hidden=true, direction='float', on_open=on_open, on_close=on_close})
local newTerm = Terminal:new({ hidden=true, direction='float', on_open=on_open, on_close=on_close})

-- toggle functions
function _lazygit_toggle()
  lazygit:toggle()
end

function _newTerm_toggle()
  newTerm:toggle()
end

-- setting keymaps
local Terminal  = require('toggleterm.terminal').Terminal
vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-\\>", "<cmd>lua _newTerm_toggle()<CR>", {noremap = true, silent = true})

-- in window mappings

-- function _G.set_terminal_keymaps()
--   local opts = {buffer = 0}
--   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- end
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
--
