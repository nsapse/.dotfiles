return {
	"folke/todo-comments.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("todo-comments").setup({
			colors = {
				error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
				warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
				info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
				hint = { "LspDiagnosticsDefaultHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
			},
		})
	end,
}
