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
					require("mason-lspconfig").setup({
						-- ensure_installed = {
						-- 	"bashls",
						-- 	"clangd",
						-- 	"eslint",
						-- 	"jedi_language_server",
						-- 	"lua_ls",
						-- 	"rust_analyzer",
						-- 	"arduino_language_server",
						-- 	"cssls",
						-- 	"dockerls",
						-- 	"gopls",
						-- 	"html",
						-- 	-- "jdtls",
						-- 	"jsonls",
						-- 	"ltex",
						-- 	"lua_ls",
						-- 	"marksman",
						-- 	"solargraph",
						-- 	"sqlls",
						-- 	"texlab",
						-- 	"vimls",
						-- },
					})
				end,
			}, -- Optional
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
				config = function()
					require("mason-null-ls").setup({
						ensure_installed = nil,
						automatic_installation = true,
						automatic_setup = false,
					})
				end,
				dependencies = {
					"williamboman/mason.nvim",
					{
						"jose-elias-alvarez/null-ls.nvim",
						config = function()
							local null_ls = require("null-ls")
							null_ls.setup({
								sources = {
									-- injecting code actions
									null_ls.builtins.code_actions.eslint,
									null_ls.builtins.code_actions.gitsigns,
									null_ls.builtins.code_actions.gomodifytags,
									null_ls.builtins.code_actions.impl,
									null_ls.builtins.code_actions.refactoring,
									null_ls.builtins.code_actions.shellcheck,
									null_ls.builtins.code_actions.xo,

									-- -- injecting diagnostics
									-- null_ls.builtins.diagnostics.clang_check,
									-- null_ls.builtins.diagnostics.codespell,
									-- null_ls.builtins.diagnostics.commitlint,
									-- null_ls.builtins.diagnostics.cpplint,
									-- null_ls.builtins.diagnostics.dotenv_linter,
									-- -- null_ls.builtins.diagnostics.eslint,
									-- null_ls.builtins.diagnostics.flake8,
									-- null_ls.builtins.diagnostics.jshint,
									-- null_ls.builtins.diagnostics.jsonlint,
									-- null_ls.builtins.diagnostics.luacheck,
									-- null_ls.builtins.diagnostics.markdownlint,
									-- null_ls.builtins.diagnostics.xo,
									-- null_ls.builtins.diagnostics.yamllint,
									-- null_ls.builtins.diagnostics.zsh,
									-- -- null_ls.builtins.diagnostics.checkstyle, -- for java
									--
									-- -- formatters
									-- null_ls.builtins.formatting.autopep8,
								},
							})
						end,
					},
				},
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
	{ "ray-x/lsp_signature.nvim", config = function()
        require('lsp_signature').setup()
	end},
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
}
