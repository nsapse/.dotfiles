local map = vim.keymap.set

--            diffview
map("n", "<leader>do", ":DiffviewOpen<cr>")
map("n", "<leader>dc", ":DiffviewClose<cr>")

--            easy align
map({ "n", "x", "v" }, "<leader>ga", "<Plug>(EasyAlign)")

-- undotree
map("n", "<leader><leader>u", ":UndotreeToggle<cr>")

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

-- autoformat
map("n", "<leader>nf", ":Neoformat<CR>")

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

-- Neorg
map({'n', 'v'}, '<leader>nn', ":Neorg<cr>")

-- Open Oil for File Browsing
map("n", "-", require("oil").open, { desc = "Open parent directory" })

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

-- OIL - open parent directory
map("n", "leader<->", "<CMD>Oil --float<CR>")


