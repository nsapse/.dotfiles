local map = vim.keymap.set

--            diffview
map("n", "<leader>do", ":DiffviewOpen<cr>")
map("n", "<leader>dc", ":DiffviewClose<cr>")

--            easy align
map({ "n", "x", "v" }, "<leader>ga", "<Plug>(EasyAlign)")

-- undotree
map('n', '<leader><leader>u', ':UndotreeToggle<cr>')

-- sandwich
vim.g.operator_sandwich_no_default_key_mappings = 1
vim.g.textobj_sandwich_no_default_key_mappings = 1
map('n', '<leader>sa', '<Plug>(operator-sandwich-add)', {silent = true, unique = true})
map('n', '<leader>sar', '<Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)',{silent = true, unique = true})

-- vimtex
map('n', '<leader><leader>vc', ':VimtexCompile<cr>')

-- arduino
map('n', '<leader>asb ', ':ArduinoChooseBoard<cr>')
map('n', '<leader>acp ', ':ArduinoChooseBoard<cr>')
map('n', '<leader>au ', ':ArduinoUpload<cr>')
map('n', '<leader>av ', ':ArduinoVerify<cr>')

-- toggleterm (may need to breakout)
require("mappings.toggleterm")

-- Symbols Outline
vim.api.nvim_set_keymap("n", "<C-t>", ":SymbolsOutline<CR>", {noremap = true, silent = true})


--leap stuff
map({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward-to)')
map({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward-to)')
map({'n', 'x', 'o'}, 't', '<Plug>(leap-forward-till)')
map({'n', 'x', 'o'}, 'T', '<Plug>(leap-backward-till)')

-- autoformat
map('n', '<leader>nf', ':Neoformat<CR>')

-- Code action menu
map({'n', 'v'}, '<leader>am', ':CodeActionMenu<CR>')
-- Saga

