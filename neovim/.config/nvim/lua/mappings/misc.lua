local map = vim.keymap.set

--            diffview
map("n", "<leader>do", ":DiffviewOpen<cr>")
map("n", "<leader>dc", ":DiffviewClose<cr>")

--            easy align
map({ "n", "x", "v" }, "<leader>ga", "<Plug>(EasyAlign)")

-- undotree
map("n", "<leader><leader>u", ":UndotreeToggle<cr>")

-- sandwich
-- vim.g.operator_sandwich_no_default_key_mappings = 1
-- vim.g.textobj_sandwich_no_default_key_mappings = 1
-- map("n", "<leader>sa", "<Plug>(operator-sandwich-add)", { silent = true, unique = true })
-- map(
-- 	"n",
-- 	"<leader>sar",
-- 	"<Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)",
-- 	{ silent = true, unique = true }
-- )

-- vimtex
map("n", "<leader><leader>vc", ":VimtexCompile<cr>")

-- arduino
map("n", "<leader>asb ", ":ArduinoChooseBoard<cr>")
map("n", "<leader>acp ", ":ArduinoChooseBoard<cr>")
map("n", "<leader>au ", ":ArduinoUpload<cr>")
map("n", "<leader>av ", ":ArduinoVerify<cr>")

-- toggleterm (may need to breakout)
require("mappings.toggleterm")

-- Symbols Outline
vim.api.nvim_set_keymap("n", "<C-t>", ":SymbolsOutline<CR>", { noremap = true, silent = true })

--leap stuff
map({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)")
map({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)")
-- map({'n', 'x', 'o'}, 't', '<Plug>(leap-forward-till)')
-- map({'n', 'x', 'o'}, 'T', '<Plug>(leap-backward-till)')

-- autoformat
map("n", "<leader>nf", ":Neoformat<CR>")

-- Code action menu
-- map({'n', 'v'}, '<leader>am', ':CodeActionMenu<CR>')
-- Saga

-- Refactor
-- prompt for a refactor to apply when the remap is triggered
map(
	{ "v", "n" },
	"<leader>rr",
	":lua require('refactoring').select_refactor()<CR>",
	{ noremap = true, silent = true, expr = false }
)
map(
	{ "v", "n" },
	"<leader><leader>R",
	":lua require('refactoring').select_refactor()<CR>",
	{ noremap = true, silent = true, expr = false }
)

-- Neotree
map("n", "<C-n>", ":NeoTreeShowToggle<cr>")

-- PrettyHover - Pretty Hover on K
-- map("n", "K", function()
-- 	require("pretty_hover").hover()
-- end)

-- Window Selector
map("n", "<leader>ww", function()
    local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })

-- Neorg
map({'n', 'v'}, '<leader>nn', ":Neorg<cr>")

-- Open Oil for File Browsing
map("n", "-", require("oil").open, { desc = "Open parent directory" })

-- Session Persistence


-- Saga

-- Compiler.Nvim
    -- Open compiler
    -- map('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
    -- map('n', '<leader><leader>c', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
    -- -- Toggle compiler results
    -- map('n', '<S-F6>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
    -- map('n', '<leader>ct', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })


-- Devdocs
map('n', '<leader>doc', '<cmd>DevdocsOpenFloat<CR>')

-- Open DBUI
map('n', '<leader>DB', '<cmd>DBUI<CR>')

-- Open Blame
map('n', '<leader>bt', '<cmd>BlameToggle<CR>')
-- Window Manipulation

map('n', '<leader>wm', '<cmd>WindowsMaximize<CR>')
map('n', '<leader>wmv', '<cmd>WindowsMaximizeVertically<CR>')
map('n', '<leader>wmh', '<cmd>WindowsMaximizeHorizontally<CR>')
map('n', '<leader>we', '<cmd>WindowsEqualize<CR>')
map('n', '<leader>waw', '<cmd>WindowsToggleAutowidth<CR>')


-- Neotest
map("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", {})
map("n", "<leader>tr", ":Neotest run<cr>", {})
map("n", "<leader>ta", ":Neotest attach<cr>", {})
map("n", "<leader>to", ":Neotest output-panel<cr>", {})
