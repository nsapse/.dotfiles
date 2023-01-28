vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
	"ray-x/lsp_signature.nvim",
	-- fidget
	 "j-hui/fidget.nvim",

	----------------------
	---~~[[Treesitter]]~~---
	----------------------
	-- Treesitter
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
	"JoosepAlviste/nvim-ts-context-commentstring",


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
}
