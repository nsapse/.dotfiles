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

	--Maximize Windows
	-- {
	-- 	"anuvyklack/windows.nvim",
	-- 	dependencies = {
	-- 		"anuvyklack/middleclass",
	-- 		"anuvyklack/animation.nvim",
	-- 	},
	-- 	config = function()
	-- 		vim.o.winwidth = 10
	-- 		vim.o.winminwidth = 10
	-- 		vim.o.equalalways = false
	-- 		require("windows").setup()
	-- 	end,
	-- },
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
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	{ "MunifTanjim/nui.nvim", lazy = true },
    { "nvim-neotest/nvim-nio" },

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
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup()
		end,
	},
}
