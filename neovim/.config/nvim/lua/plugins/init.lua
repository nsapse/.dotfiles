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
	"junegunn/vim-easy-align",
	-- { "machakann/vim-sandwich" },
	"raimondi/delimitmate", -- look into jiangmiao/auto-pairs
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

	--Registers
	"tversteeg/registers.nvim",

	--Misc
	"tpope/vim-unimpaired",

	--
	"tpope/vim-repeat",
	"unblevable/quick-scope",

	-- symbols otline
	{ "simrat39/symbols-outline.nvim", config = true },

	-- chadtree
	-- "ms-jpq/chadtree",
	{ "nvim-neo-tree/neo-tree.nvim", dependencies = {
		"MunifTanjim/nui.nvim",
	} },

	-- Window Picker
	{
		"s1n7ax/nvim-window-picker",
		tag = "v1.*",
		config = function()
			require("window-picker").setup({
				fg_color = "#ededed",
				-- if you have include_current_win == true, then current_win_hl_color will
				-- be highlighted using this background color
				current_win_hl_color = "#e35e4f",

				-- all the windows except the curren window will be highlighted using this
				-- color
				other_win_hl_color = "#44cc41",
			})
		end,
	},

	--  "simnalamburt/vim-mundo" },
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

	-------------------
	--~~ Debugging ~~--
	-------------------
	-- setup nvim DAP
	--  "sakhnik/nvim-gdb", opt = true, ft = { "c", "cpp" } },

	----------
	--~~Go~~--
	----------
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
	-- "lervag/vimtex",
	-- {
	-- 	"evesdropper/luasnip-latex-snippets.nvim",
	-- 	-- using treesitter.
	-- 	dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
	-- 	config = function()
	-- 		require("luasnip-latex-snippets").setup()
	-- 	end,
	-- 	-- treesitter is required for markdown
	-- },
	"KeitaNakamura/tex-conceal.vim",
	-- "evesdropper/luasnip-latex-snippets.nvim",

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
