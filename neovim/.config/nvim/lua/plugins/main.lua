local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Function to allow breaking out into setup files
function get_config(name)
	return string.format('require("plugins/config/%s")', name)
end

require("lazy").setup({
	----------------------
	---~~[Editing Actions~]~
	----------------------

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = get_config("refactor"),
	},

	-- Code Formatting
	"junegunn/vim-easy-align",
	"machakann/vim-sandwich",
	"raimondi/delimitmate", -- look into jiangmiao/auto-pairs
	 "sbdchd/neoformat",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

    {
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = get_config("todo-comments"),
	},

	----------------------
	---~~Navigation~~---
	----------------------

	--Registers
	"tversteeg/registers.nvim",

	--Misc
	"tpope/vim-unimpaired",

	-- which_key
    "folke/which-key.nvim",

	 "ggandor/leap.nvim",
	 "ggandor/leap-spooky.nvim",
	 "ggandor/flit.nvim",

	"tpope/vim-repeat",
    -- "unblevable/quick-scope",

	-- Vista
	"liuchengxu/vista.vim",

	-- chadtree
	 "ms-jpq/chadtree",

	--  "simnalamburt/vim-mundo" },
	 "mbbill/undotree",
	"simeji/winresizer",

	--Telescope
	 "nvim-telescope/telescope.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",

	-- TODO - get nvim worktree going
	--FZF
    {"junegunn/fzf.vim", dependencies = { "junegunn/fzf", build = "cd ~/.fzf && ./install --all" } },

	--wildermenu
    {"gelguy/wilder.nvim", build = ":UpdateRemotePlugins" },
	----------------
	---~~[[LSP]]~~--
	----------------
	--LSPconfig
	--  "neovim/nvim-lspconfig",
	--
	-- "nvim-lua/lsp_extensions.nvim",
	-- "nvim-lua/plenary.nvim",

	"ray-x/lsp_signature.nvim",
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
      }
    },
	-- mason

    -- "williamboman/mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",
    -- -- "jayp0521/mason-null-ls.nvim",
    -- "RubixDev/mason-update-all",
    -- "jayp0521/mason-nvim-dap.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",
	-- null-ls
	--  "jose-elias-alvarez/null-ls.nvim",

	-- fidget
	 "j-hui/fidget.nvim",

	----------------------
	---~~[[Treesitter]]~~---
	----------------------
	-- Treesitter
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = get_config("treesitter") },
    {"nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
	"JoosepAlviste/nvim-ts-context-commentstring",

	----------------------
	---~~[Snippets]~~-------
	------------------- --

	-- "honza/vim-snippets",
	-- "rafamadriz/friendly-snippets",
	-- --luasnip
	--  "L3MON4D3/LuaSnip",
	-- Load Snippets into Luasnip

	----------------------
	---~~[AutoComplete]~~---
	----------------------
	--CMP Stuff
	--  "hrsh7th/nvim-cmp",
	-- "hrsh7th/cmp-nvim-lsp",
	-- "hrsh7th/cmp-nvim-lua",
	-- "hrsh7th/cmp-buffer",
	-- "ray-x/cmp-treesitter",
	-- "hrsh7th/cmp-path",
	-- "hrsh7th/cmp-cmdline",
	-- -- "hrsh7th/cmp-vsnip",
	-- "saadparwaiz1/cmp_luasnip",

	-- lspkind to make it prettier
	"onsails/lspkind-nvim",

	-------------------
	--~~ Arduino   ~~--
	-------------------
	 "stevearc/vim-arduino",
	 "sudar/vim-arduino-syntax",

	-------------------
	--~~ Debugging ~~--
	-------------------
	-- setup nvim DAP
	--  "mfussenegger/nvim-dap",
	--  "mfussenegger/nvim-dap-python",
	-- "rcarriga/nvim-dap-ui",
	-- "theHamsta/nvim-dap-virtual-text",
	--  "sakhnik/nvim-gdb", opt = true, ft = { "c", "cpp" } },

	----------
	--~~Go~~--
	----------
	------------
	--~~[HTML]~~--
	------------

	 "mattn/emmet-vim",
    {"turbio/bracey.vim", ft = { "html", "css", "javascript" }, build = "npm install --prefix server" },

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

	{"plasticboy/vim-markdown", ft = { "mardown", "md" } },
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
	 "lervag/vimtex",

	----------------
	-----Lua--------
	----------------
	 "folke/neodev.nvim",

	------------
	-- ~~UI/UX~~ --
	------------

	-- Colorschemes
	 "Murtaza-Udaipurwala/gruvqueen",
	 "RRethy/nvim-base16",
	 "b4skyx/serenade",
	 "fenetikm/falcon",
	"folke/tokyonight.nvim",
	 "jacoborus/tender.vim",
	 "maaslalani/nordbuddy",
	 "mhartington/oceanic-next",
	-- use {'morhetz/gruvbox'              , opt=true, c{md=':colorsche}me'}
	-- use {'npxbr/gruvbox.nvim'           , opt=true, c{md=':colorsche}me'}
	 "rktjmp/lush.nvim",
	 "sainnhe/forest-night",
	 "sainnhe/gruvbox-material",
	 "sainnhe/sonokai",
	 "shaunsingh/nord.nvim",
	--  "ulwlu/elly.vim",
	 "EdenEast/nightfox.nvim",
	 "NTBBloodbath/doom-one.nvim",
	 "ellisonleao/gruvbox.nvim",
	"rmehri01/onenord.nvim",
	"catppuccin/nvim",
	"ful1e5/onedark.nvim",

	-- Focus
	 "folke/twilight.nvim",

	-- Coloration, Highlighting, Icons, Readability
	"markonm/traces.vim",
	"p00f/nvim-ts-rainbow",
	"ryanoasis/vim-devicons",
	"yggdroot/indentline",
	"luukvbaal/stabilize.nvim",

	--UI/UX Elements
	"voldikss/vim-floaterm",
    "nvim-lualine/lualine.nvim",
    'nvim-telescope/telescope-ui-select.nvim',

	-- BarBar
	 "romgrk/barbar.nvim",
    "nvim-lua/popup.nvim",
	"kyazdani42/nvim-web-devicons",

	--additional synatax for kmonad
	"kmonad/kmonad-vim",

	----------------
	-----GIT--------
	----------------
    {"sindrets/diffview.nvim", cmd = "DiffviewOpen" },

	--gitsigns
	"lewis6991/gitsigns.nvim",

	------------------------------
	--~~Personal Organization ~~--
	------------------------------

	----------------
	-- ~~Docs, Etc--
	----------------
	"vim-utils/vim-man",
	"milisims/nvim-luaref",
})
