return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			numhl = true,
			signcolumn = true,
			linehl = false,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			sign_priority = 6,
		})
	end,
}
