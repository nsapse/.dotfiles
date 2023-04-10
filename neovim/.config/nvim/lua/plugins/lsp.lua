return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
				dependencies = {
					"williamboman/mason.nvim",
					"jose-elias-alvarez/null-ls.nvim",
				},
				config = function()
					require("mason-null-ls").setup() -- require your null-ls config here (example below)
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	},

	-- Various Other LSP Plugins
	"onsails/lspkind-nvim",
	"ray-x/lsp_signature.nvim",
	-- { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = true },
	--SAGA
	-- {
	--     "glepnir/lspsaga.nvim",
	--     event = "LspAttach",
	--     config = function()
	--         require("lspsaga").setup({})
	--     end,
	--     dependencies = {
	--         -- { "nvim-tree/nvim-web-devicons" },
	--         --Please make sure you install markdown and markdown_inline parser
	--         { "nvim-treesitter/nvim-treesitter" }
	--     },
	-- },
	-- {
	-- 	"weilbith/nvim-code-action-menu",
	-- 	cmd = "CodeActionMenu",
	-- },
}
