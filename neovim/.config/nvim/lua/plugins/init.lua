return {
	----------------------
	---~~[Editing Actions~]~
	----------------------

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},

	-- Code Formatting
	"sbdchd/neoformat",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	----------------------
	---~~Navigation~~---
	----------------------

	--Misc
	"tpope/vim-unimpaired",

	--
	"tpope/vim-repeat",
	"unblevable/quick-scope",


	-- chadtree
	-- "ms-jpq/chadtree",
	{ "nvim-neo-tree/neo-tree.nvim", dependencies = {
		"MunifTanjim/nui.nvim",
	} },

	"mbbill/undotree",
	"simeji/winresizer",

	--wildermenu
	{ "gelguy/wilder.nvim", build = ":UpdateRemotePlugins" },

	--oil.nvim for file browsing
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		config = function()
			require("oil").setup({
				view_options = {
					-- Show files and directories that start with "."
					show_hidden = true,
				},
			})
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	--persistence
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		config = function()
			require("persistence").setup()
		end,
	},
	----------------
	---~~[[LSP]]~~--
	----------------

	-------------------
	--~~ Arduino   ~~--
	-------------------
	"stevearc/vim-arduino",
	"sudar/vim-arduino-syntax",

	------------
	--~~[HTML]~~--
	------------

	"mattn/emmet-vim",
	{ "turbio/bracey.vim", ft = { "html", "css", "javascript" }, build = "npm install --prefix server" },

	----------------
	--~~[Markdown]~~--
	----------------
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		cmd = "MarkdownPreview",
	},

	{ "plasticboy/vim-markdown", ft = { "mardown", "md" } },
	--
	----------------
	--~~Python~~----
	----------------

	-------------------
	--~~Databases~~----
	-------------------
    {"tpope/vim-dadbod"},
    {'kristijanhusak/vim-dadbod-ui'},
    {'kristijanhusak/vim-dadbod-completion'},

	----------------
	--~~Golang~~----
	----------------
	-- "ray-x/go.nvim",

	----------------
	----~~Rust~~----
	----------------
	"simrat39/rust-tools.nvim",

	---------------------
	---~~Javascript~~-----
	---------------------
	"mlaursen/vim-react-snippets",

	----------------
	---~~Java~~-----
	----------------
	"mfussenegger/nvim-jdtls",

	----------------
	--~~LaTeX~~--
	----------------
-- },
	"KeitaNakamura/tex-conceal.vim",

	----------------
	-----Lua--------
	----------------
	"folke/neodev.nvim",
	"kmonad/kmonad-vim",

	----------------
	-----GIT--------
	----------------
	{ "sindrets/diffview.nvim", cmd = "DiffviewOpen" },

	--gitsigns

	------------------------------
	--~~Personal Organization ~~--
	------------------------------

	----------------
	-- ~~Docs, Etc--
	----------------
	"vim-utils/vim-man",
	"milisims/nvim-luaref",
}
