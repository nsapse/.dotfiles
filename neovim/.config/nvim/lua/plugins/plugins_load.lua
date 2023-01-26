local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Leader set to <Space>")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Function to allow breaking out into setup files
function get_config(name)
	return string.format('require("plugins/config/%s")', name)
end

require("lazy").setup({
	----------------------
	---~~[Editing Actions~]~
	----------------------

	--Firenvim

	{
		"glacambre/firenvim",
		build = function()
			vim.fn["firenvim#install"](0)
		end,
	},

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- Code Formatting
	"junegunn/vim-easy-align",
	"machakann/vim-sandwich",
	"raimondi/delimitmate", -- look into jiangmiao/auto-pairs
	{ "sbdchd/neoformat" },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},

	--Commenting
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
	},

	----------------------
	---~~Navigation~~---
	----------------------

	--Registers
	"tversteeg/registers.nvim",

	--Misc
	"tpope/vim-unimpaired",

	-- which_key
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
	-- Hop
	-- { "phaazon/hop.nvim", config = get_config("hop") },
	-- { "ggandor/lightspeed.nvim", config = get_config("lightspeed") },
	-- LEAP

	{ "ggandor/leap-spooky.nvim" },
	{ "ggandor/flit.nvim" },

	"tpope/vim-repeat",
	-- "unblevable/quick-scope",

	-- Vista
	"liuchengxu/vista.vim",

	-- chadtree
	{ "ms-jpq/chadtree", branch = "chad", build = ":CHADdeps" },

	-- Trouble
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},

	-- { "simnalamburt/vim-mundo" },
	{ "mbbill/undotree" },
	"simeji/winresizer",

	--Telescope
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },

	-- TODO - get nvim worktree going
	--FZF
	{ "junegunn/fzf.vim", dependencies = { "junegunn/fzf", build = "cd ~/.fzf && ./install --all" } },

	--wildermenu
	{ "gelguy/wilder.nvim", build = ":UpdateRemotePlugins" },
	----------------
	---~~[[LSP]]~~--
	----------------
	--LSPconfig

	--Saga
	{
		"tami5/lspsaga.nvim",
		config = function()
			require("lspsaga").init_lsp_saga()
		end,
	},

	"nvim-lua/lsp_extensions.nvim",
	"nvim-lua/plenary.nvim",

	-- lsp_signature
	"ray-x/lsp_signature.nvim",
	-- mason
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	"jayp0521/mason-null-ls.nvim",
	"RubixDev/mason-update-all",
	"jayp0521/mason-nvim-dap.nvim",
	-- require("mason-tool-installer").setup()

	-- null-ls
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- fidget
	{ "j-hui/fidget.nvim" },
	{
		"kosayoda/nvim-lightbulb",
		dependencies = "antoinemadec/FixCursorHold.nvim",
		config = function()
			require("nvim-lightbulb").setup({ autocmd = { enabled = true } })
		end,
	},

	----------------------
	---~~[[Treesitter]]~~---
	----------------------
	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- { "nvim-treesitter/playground", opt = true, cmd = "TSPlaygroundToggle" },
	"JoosepAlviste/nvim-ts-context-commentstring",

	----------------------
	---~~[Snippets]~~-------
	------------------- --

	"honza/vim-snippets",
	-- "hrsh7th/vim-vsnip",
	-- "hrsh7th/vim-vsnip-integ",
	"rafamadriz/friendly-snippets",
	--luasnip
	{ "L3MON4D3/LuaSnip" },

	----------------------
	---~~[AutoComplete]~~---
	----------------------
	--CMP Stuff
	{ "hrsh7th/nvim-cmp",
		config = true,
	},
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"ray-x/cmp-treesitter",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	-- "hrsh7th/cmp-vsnip",
	"saadparwaiz1/cmp_luasnip",

	-- "quangnguyen30192/cmp-nvim-ultisnips",
	-- { "kdheepak/cmp-latex-symbols", opt = true, ft = { "latex", "tex", "texmf" } },
	-- { "pontusk/cmp-vimwiki-tags", opt = true, ft = { "wiki", "vimwiki" } },

	-- lspkind to make it prettier
	"onsails/lspkind-nvim",

	-------------------
	--~~ Arduino   ~~--
	-------------------
	{ "stevearc/vim-arduino" },
	{ "sudar/vim-arduino-syntax" },

	-------------------
	--~~ Debugging ~~--
	-------------------
	-- setup nvim DAP
	{ "mfussenegger/nvim-dap" },
	{ "mfussenegger/nvim-dap-python" },
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	-- { "sakhnik/nvim-gdb", opt = true, ft = { "c", "cpp" } },

	----------
	--~~Go~~--
	----------
	------------
	--~~[HTML]~~--
	------------

	{ "mattn/emmet-vim" },
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
	"ray-x/go.nvim",
	----------------
	----~~Rust~~----
	----------------
	{ "simrat39/rust-tools.nvim" },

	---------------------
	---~~Javascript~~-----
	---------------------
	{ "mlaursen/vim-react-snippets" },

	----------------
	---~~Java~~-----
	----------------
	{ "mfussenegger/nvim-jdtls" },
	----------------
	--~~LaTeX~~--
	----------------
	{ "lervag/vimtex" },

	----------------
	-----Lua--------
	----------------
	{ "folke/neodev.nvim" },

	------------
	-- ~~UI/UX~~ --
	------------

	-- Colorschemes
	{ "Murtaza-Udaipurwala/gruvqueen" },
	{ "RRethy/nvim-base16" },
	{ "b4skyx/serenade" },
	{ "fenetikm/falcon" },
	"folke/tokyonight.nvim",
	{ "jacoborus/tender.vim" },
	{ "maaslalani/nordbuddy" },
	{ "mhartington/oceanic-next" },
	-- use {'morhetz/gruvbox'              , opt=true, c{md=':colorsche}me'}
	-- use {'npxbr/gruvbox.nvim'           , opt=true, c{md=':colorsche}me'}
	{ "rktjmp/lush.nvim" },
	{ "sainnhe/forest-night" },
	{ "sainnhe/gruvbox-material" },
	{ "sainnhe/sonokai" },
	{ "shaunsingh/nord.nvim" },
	-- { "ulwlu/elly.vim" },
	{ "EdenEast/nightfox.nvim" },
	{ "NTBBloodbath/doom-one.nvim" },
	{ "ellisonleao/gruvbox.nvim" },
	"rmehri01/onenord.nvim",
	"catppuccin/nvim",
	"ful1e5/onedark.nvim",

	{
	  'AlexvZyl/nordic.nvim',
	  lazy = false,
	  priority = 1000,
	  config = function()
		require 'nordic'.load()
	  end
	},
	-- Focus
	{ "folke/twilight.nvim" },

	-- Coloration, Highlighting, Icons, Readability
	"markonm/traces.vim",
	"p00f/nvim-ts-rainbow",
	"ryanoasis/vim-devicons",
	"yggdroot/indentline",
	"luukvbaal/stabilize.nvim",

	--UI/UX Elements
	"voldikss/vim-floaterm",
	{ "nvim-lualine/lualine.nvim" },

	-- BarBar
	{ "romgrk/barbar.nvim",
		config = function()
			return get_config("barbar")
		end
	},
	{ "nvim-lua/popup.nvim", opt = true },
	"kyazdani42/nvim-web-devicons",

	--nvim GPS
	{
		"SmiteshP/nvim-gps",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	--biscuits
	{ "code-biscuits/nvim-biscuits",
		config = function()
			return get_config("biscuits")
		end
	},

	--additional synatax for kmonad
	"kmonad/kmonad-vim",

	-- LITE
	-- { "ldelossa/litee.nvim" },
	-- { "ldelossa/litee-calltree.nvim" },
	-- require("litee.lib").setup({})
	-- require("litee.calltree").setup({})

	----------------
	-----GIT--------
	----------------
	{ "sindrets/diffview.nvim", opt = true, cmd = "DiffviewOpen" },

	--gitsigns
	"lewis6991/gitsigns.nvim",
	------------------------------
	--~~Personal Organization ~~--
	------------------------------
	-- VimWiki
	-- { "vimwiki/vimwiki" },
	-- { "tbabej/taskwiki" },
	-- { "powerman/vim-plugin-AnsiEsc", opt = true, ft = { "wiki", "vimwiki" } },
	-- use 'chipsenkbeil/vimwiki-server.nvim'
	-- use 'chipsenkbeil/vimwiki.nvim'

	-- Neorg
	{
		"nvim-neorg/neorg",
		dependencies = "nvim-lua/plenary.nvim",
	},

	-- Spellcheck and grammar
	{
		"brymer-meneses/grammar-guard.nvim",
		dependencies = "neovim/nvim-lspconfig",
	},

	-- this is required for grammar guard
	-- "williamboman/nvim-lsp-installer",

	--orgmode.nvim

	{
		"nvim-orgmode/orgmode",
	},

	"akinsho/org-bullets.nvim",
	"lukas-reineke/headlines.nvim",

	----------------
	-- ~~Docs, Etc--
	----------------
	"vim-utils/vim-man",
	"milisims/nvim-luaref",
})

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
