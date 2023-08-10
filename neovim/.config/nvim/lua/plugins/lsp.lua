return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				"williamboman/mason.nvim",
				config = function()
					require("mason-lspconfig").setup({})
				end,
			}, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
				dependencies = {
					"williamboman/mason.nvim",
					"jose-elias-alvarez/null-ls.nvim",
				},
				config = function()
					require("mason").setup()
					require("mason-null-ls").setup({
						ensure_installed = {
							-- Opt to list sources here, when available in mason.
						},
						automatic_installation = false,
						handlers = {},
					})
					require("null-ls").setup({
						sources = {
							-- Anything not supported by mason.
						},
					})
				end,
			},
			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	},

	-- Various Other LSP Plugins
	"onsails/lspkind-nvim",
	--    local cfg = {
	--        floating_window = false,
	--    },
	-- {
	-- 	"ray-x/lsp_signature.nvim",
	-- 	config = function()
	-- 		require("lsp_signature").setup(cfg)
	-- 	end,
	-- },
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", config = true },
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

	-- for typescript
	{ "jose-elias-alvarez/typescript.nvim" },
}
