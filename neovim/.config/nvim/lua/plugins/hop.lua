require("hop").setup()

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap(
	"n",
	"f",
	"<cmd>lua require'hop'.hint_char1()<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"n",
	"F",
	"<cmd>lua require'hop'.hint_words()<cr>",
	{}
)
--[[ vim.api.nvim_set_keymap(
	"o",
	"f",
	"<cmd>lua require'hop'.hint_char1({false, inclusive_jump = true })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"o",
	"F",
	"<cmd>lua require'hop'.hint_char1({inclusive_jump = true })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"n",
	"t",
	"<cmd>lua require'hop'.hint_words()<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"n",
	"T",
	"<cmd>lua require'hop'.hint_words()<cr>",
	{}
) ]]
