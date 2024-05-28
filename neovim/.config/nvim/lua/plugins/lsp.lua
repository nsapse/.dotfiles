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

			{ "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- Optional
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
			{
				"L3MON4D3/LuaSnip",
				build = vim.fn.has("win32") ~= 0 and "make install_jsregexp" or nil,
				dependencies = {
					"rafamadriz/friendly-snippets",
					"benfowler/telescope-luasnip.nvim",
				},
				config = function(_, opts)
					if opts then
						require("luasnip").config.setup(opts)
					end
					vim.tbl_map(function(type)
						require("luasnip.loaders.from_" .. type).lazy_load()
					end, { "vscode", "snipmate", "lua" })
					-- friendly-snippets - enable standardized comments snippets
					require("luasnip").filetype_extend("typescript", { "tsdoc" })
					require("luasnip").filetype_extend("javascript", { "jsdoc" })
					require("luasnip").filetype_extend("lua", { "luadoc" })
					require("luasnip").filetype_extend("python", { "pydoc" })
					require("luasnip").filetype_extend("rust", { "rustdoc" })
					require("luasnip").filetype_extend("cs", { "csharpdoc" })
					require("luasnip").filetype_extend("java", { "javadoc" })
					require("luasnip").filetype_extend("c", { "cdoc" })
					require("luasnip").filetype_extend("cpp", { "cppdoc" })
					require("luasnip").filetype_extend("php", { "phpdoc" })
					require("luasnip").filetype_extend("kotlin", { "kdoc" })
					require("luasnip").filetype_extend("ruby", { "rdoc" })
					require("luasnip").filetype_extend("javascript", { "javascriptreact" })
					require("luasnip").filetype_extend("javascript", { "html" })
					require("luasnip").filetype_extend("sh", { "shelldoc" })
				end,
			}, -- Required
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

	{
		"nvim-java/nvim-java",
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({})
		end,
	},
}
