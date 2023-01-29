local map = vim.keymap
--            chadtree
map.set("n", "<C-n>", ":CHADopen<CR>", { silent = true })

--            diffview
map.set("n", "<leader>do", ":DiffviewOpen<cr>")
map.set("n", "<leader>dc", ":DiffviewClose<cr>")

--            easy align
map.set({ "n", "x", "v" }, "<leader>ga", "<Plug>(EasyAlign)")

-- undotree
map.set('n', '<leader><leader>u', ':UndotreeToggle<cr>')

-- sandwich
vim.g.operator_sandwich_no_default_key_mappings = 1
vim.g.textobj_sandwich_no_default_key_mappings = 1
map.set('n', '<leader>sa', '<Plug>(operator-sandwich-add)', {silent = true, unique = true})
map.set('n', '<leader>sar', '<Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)',{silent = true, unique = true})

-- vimtex
map.set('n', '<leader><leader>vc', ':VimtexCompile<cr>')

-- arduino
map.set('n', '<leader>asb ', ':ArduinoChooseBoard<cr>')
map.set('n', '<leader>acp ', ':ArduinoChooseBoard<cr>')
map.set('n', '<leader>au ', ':ArduinoUpload<cr>')
map.set('n', '<leader>av ', ':ArduinoVerify<cr>')

-- toggleterm (may need to breakout)
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
