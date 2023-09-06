return {
	------------
	-- ~~UI/UX~~ --
	------------

	-- Coloration, Highlighting, Icons, Readability
	"markonm/traces.vim",
	"ryanoasis/vim-devicons",
	"yggdroot/indentline",
	"luukvbaal/stabilize.nvim",

	-- Composer for Macros
	-- {
	-- 	"ecthelionvi/NeoComposer.nvim",
	-- 	dependencies = { "kkharji/sqlite.lua" },
	-- 	opts = {},
	-- },

	--UX Elements
	{ "akinsho/toggleterm.nvim", config = true },
	"SmiteshP/nvim-gps",

	-- {
	-- 	"Fildo7525/pretty_hover",
	-- 	event = "LspAttach",
	-- 	opts = {},
	-- },
	-- BarBar
	-- "romgrk/barbar.nvim",

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},

	"nvim-lua/popup.nvim",

	-- fidget
	-- { "j-hui/fidget.nvim", config = true },
	{ "MunifTanjim/nui.nvim", lazy = true },
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		lsp = {
	-- 			override = {
	-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 				["vim.lsp.util.stylize_markdown"] = true,
	-- 			},
	-- 		},
	-- 		presets = {
	-- 			bottom_search = true,
	-- 			command_palette = true,
	-- 			long_message_to_split = true,
	-- 		},
	-- 	},
	-- 	-- stylua: ignore
	-- 	keys = {
	-- 		{
	-- 			"<C-Enter>",
	-- 			function()
	-- 				require("noice").redirect(vim.fn.getcmdline())
	-- 			end,
	-- 			mode = "c",
	-- 			desc = "Redirect Cmdline",
	-- 		},
	-- 		{
	-- 			"<leader>snl",
	-- 			function()
	-- 				require("noice").cmd("last")
	-- 			end,
	-- 			desc = "Noice Last Message",
	-- 		},
	-- 		{
	-- 			"<leader>snh",
	-- 			function()
	-- 				require("noice").cmd("history")
	-- 			end,
	-- 			desc = "Noice History",
	-- 		},
	-- 		{
	-- 			"<leader>sna",
	-- 			function()
	-- 				require("noice").cmd("all")
	-- 			end,
	-- 			desc = "Noice All",
	-- 		},
	-- 		{
	-- 			"<leader>snd",
	-- 			function()
	-- 				require("noice").cmd("dismiss")
	-- 			end,
	-- 			desc = "Dismiss All",
	-- 		},
	-- 		{
	-- 			"<c-f>",
	-- 			function()
	-- 				if not require("noice.lsp").scroll(4) then
	-- 					return "<c-f>"
	-- 				end
	-- 			end,
	-- 			silent = true,
	-- 			expr = true,
	-- 			desc = "Scroll forward",
	-- 			mode = { "i", "n", "s" },
	-- 		},
	-- 		{
	-- 			"<c-b>",
	-- 			function()
	-- 				if not require("noice.lsp").scroll(-4) then
	-- 					return "<c-b>"
	-- 				end
	-- 			end,
	-- 			silent = true,
	-- 			expr = true,
	-- 			desc = "Scroll backward",
	-- 			mode = { "i", "n", "s" },
	-- 		},
	-- 	},
	-- }, -- Noice
	-- Which Key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				ui = {
					enable = false,
					code_action = "",
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
}
