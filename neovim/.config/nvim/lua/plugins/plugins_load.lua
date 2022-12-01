vim.cmd([[packadd packer.nvim]])

-- Function to allow breaking out into setup files
function get_config(name)
	return string.format('require("plugins/config/%s")', name)
end

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	----------------------
	---~~[Editing Actions~]~
	----------------------

	--Firenvim

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = get_config("refactor"),
	})

	-- Code Formatting
	use("junegunn/vim-easy-align")
	use("machakann/vim-sandwich")
	use("raimondi/delimitmate") -- look into jiangmiao/auto-pairs
	use({ "sbdchd/neoformat" })
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = get_config("todo-comments"),
	})

	----------------------
	---~~Navigation~~---
	----------------------

	--Registers
	use("tversteeg/registers.nvim")

	--Misc
	use("tpope/vim-unimpaired")

	-- which_key
	use({ "folke/which-key.nvim", config = get_config("which-key") })

	-- Hop
	-- use({ "phaazon/hop.nvim", config = get_config("hop") })
	-- use({ "ggandor/lightspeed.nvim", config = get_config("lightspeed") })
	-- LEAP
	use({ "ggandor/leap.nvim" })
	use({ "ggandor/leap-spooky.nvim" })
	use({ "ggandor/flit.nvim" })
	require('leap').add_default_mappings()
	require('leap-spooky').setup()
	require('flit').setup()

	use("tpope/vim-repeat")
	use("unblevable/quick-scope")

	-- Vista
	use("liuchengxu/vista.vim")

	-- chadtree
	use({ "ms-jpq/chadtree", branch = "chad", run = ":CHADdeps" })

	-- Trouble
	use("folke/trouble.nvim")
	require("trouble").setup({})

	-- use({ "simnalamburt/vim-mundo" })
	use({ "mbbill/undotree" })
	use("simeji/winresizer")

	--Telescope
	use({ "nvim-telescope/telescope.nvim", config = get_config("telescope") })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- TODO - get nvim worktree going
	--FZF
	use({ "junegunn/fzf.vim", requires = { "junegunn/fzf", run = "cd ~/.fzf && ./install --all" } })

	--wildermenu
	use({ "gelguy/wilder.nvim", run = ":UpdateRemotePlugins" })
	----------------
	---~~[[LSP]]~~--
	----------------
	--LSPconfig
	use({ "neovim/nvim-lspconfig", config = get_config("lsp-config") })

	--Saga
	use({ "tami5/lspsaga.nvim" })
	local saga = require("lspsaga")
	saga.init_lsp_saga()

	use("nvim-lua/lsp_extensions.nvim")
	use("nvim-lua/plenary.nvim")

	-- lsp_signature
	use("ray-x/lsp_signature.nvim")
	require("lsp_signature").setup()

	-- mason
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
		"RubixDev/mason-update-all",
		"jayp0521/mason-nvim-dap.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",
	})
	require("mason").setup()
	require("mason-lspconfig").setup()
	require("mason-null-ls").setup()
	require("mason-nvim-dap").setup()
	require("mason-update-all").setup()
	-- require("mason-tool-installer").setup()

	-- null-ls
	use({ "jose-elias-alvarez/null-ls.nvim", config = get_config("null-ls") })

	-- fidget
	use({ "j-hui/fidget.nvim" })
	require("fidget").setup({})

	----------------------
	---~~[[Treesitter]]~~---
	----------------------
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = get_config("treesitter") })
	use({ "nvim-treesitter/playground", opt = true, cmd = "TSPlaygroundToggle" })
	use("JoosepAlviste/nvim-ts-context-commentstring")

	----------------------
	---~~[Snippets]~~-------
	------------------- --
	-- within packer init {{{
	-- use({
	-- 	"SirVer/ultisnips",
	-- 	requires = { { "honza/vim-snippets", rtp = "." } },
	-- })

	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	use("honza/vim-snippets")
	-- use("hrsh7th/vim-vsnip")
	-- use("hrsh7th/vim-vsnip-integ")
	use("rafamadriz/friendly-snippets")
	--luasnip
	use({ "L3MON4D3/LuaSnip", config = get_config("luasnip") })
	-- Load Snippets into Luasnip
	require("luasnip/loaders/from_vscode").lazy_load()

	----------------------
	---~~[AutoComplete]~~---
	----------------------
	--CMP Stuff
	use({ "hrsh7th/nvim-cmp", config = get_config("cmp") })
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-buffer")
	use("ray-x/cmp-treesitter")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	-- use("hrsh7th/cmp-vsnip")
	use("saadparwaiz1/cmp_luasnip")

	-- use("quangnguyen30192/cmp-nvim-ultisnips")
	-- use({ "kdheepak/cmp-latex-symbols", opt = true, ft = { "latex", "tex", "texmf" } })
	-- use({ "pontusk/cmp-vimwiki-tags", opt = true, ft = { "wiki", "vimwiki" } })

	-- lspkind to make it prettier
	use("onsails/lspkind-nvim")

	-------------------
	--~~ Arduino   ~~--
	-------------------
	use({ "stevearc/vim-arduino" })
	use({ "sudar/vim-arduino-syntax" })

	-------------------
	--~~ Debugging ~~--
	-------------------
	-- setup nvim DAP
	use({ "mfussenegger/nvim-dap", config = get_config("nvim-dap") })
	use({ "mfussenegger/nvim-dap-python" })
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use({ "sakhnik/nvim-gdb", opt = true, ft = { "c", "cpp" } })

	----------
	--~~Go~~--
	----------
	------------
	--~~[HTML]~~--
	------------

	use({ "mattn/emmet-vim" })
	use({ "turbio/bracey.vim", opt = true, ft = { "html", "css", "javascript" }, run = "npm install --prefix server" })

	----------------
	--~~[Markdown]~~--
	----------------
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		cmd = "MarkdownPreview",
	})

	use({ "plasticboy/vim-markdown", opt = true, ft = { "mardown", "md" } })
	--
	----------------
	--~~Python~~----
	----------------

	----------------
	--~~Golang~~----
	----------------
	use("ray-x/go.nvim")
	require("go").setup()

	----------------
	----~~Rust~~----
	----------------
	use({ "simrat39/rust-tools.nvim", config = get_config("rust-tools") })

	require("rust-tools").setup({})
	-- set inlay hints
	-- require("rust-tools.inlay_hints").set_inlay_hints()
	-- Command: RustHoverActions
	require("rust-tools.hover_actions").hover_actions()

	---------------------
	---~~Javascript~~-----
	---------------------
	use({ "mlaursen/vim-react-snippets" })

	----------------
	---~~Java~~-----
	----------------
	use({ "mfussenegger/nvim-jdtls" })
	require("lspconfig").jdtls.setup({ cmd = { "jdtls" } })

	----------------
	--~~LaTeX~~--
	----------------
	use({ "lervag/vimtex" })

	----------------
	-----Lua--------
	----------------
	use({ "folke/neodev.nvim" })

	local luadev = require("neodev").setup({
		lspconfig = {
			cmd = { "lua-language-server" },
		},
	})
	------------
	-- ~~UI/UX~~ --
	------------

	-- Colorschemes
	use({ "Murtaza-Udaipurwala/gruvqueen" })
	use({ "RRethy/nvim-base16" })
	use({ "b4skyx/serenade" })
	use({ "fenetikm/falcon" })
	use("folke/tokyonight.nvim")
	use({ "jacoborus/tender.vim" })
	use({ "maaslalani/nordbuddy" })
	use({ "mhartington/oceanic-next" })
	-- use {'morhetz/gruvbox'              , opt=true, c{md=':colorsche}me'}
	-- use {'npxbr/gruvbox.nvim'           , opt=true, c{md=':colorsche}me'}
	use({ "rktjmp/lush.nvim" })
	use({ "sainnhe/forest-night" })
	use({ "sainnhe/gruvbox-material" })
	use({ "sainnhe/sonokai" })
	use({ "shaunsingh/nord.nvim" })
	-- use({ "ulwlu/elly.vim" })
	use({ "EdenEast/nightfox.nvim" })
	use({ "NTBBloodbath/doom-one.nvim" })
	use({ "ellisonleao/gruvbox.nvim" })
	use("rmehri01/onenord.nvim")
	use("catppuccin/nvim")
	use("ful1e5/onedark.nvim")

	-- Focus
	use({ "folke/twilight.nvim" })

	-- Coloration, Highlighting, Icons, Readability
	use("markonm/traces.vim")
	use("p00f/nvim-ts-rainbow")
	use("ryanoasis/vim-devicons")
	use("yggdroot/indentline")
	use("luukvbaal/stabilize.nvim")

	--UI/UX Elements
	use("voldikss/vim-floaterm")
	use({ "nvim-lualine/lualine.nvim", config = get_config("lualine") })

	-- BarBar
	use({ "romgrk/barbar.nvim", config = get_config("barbar") })
	use({ "nvim-lua/popup.nvim", opt = true })
	use("kyazdani42/nvim-web-devicons")

	--nvim GPS
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	require("nvim-gps").setup()

	--biscuits
	use({ "code-biscuits/nvim-biscuits", config = get_config("biscuits") })

	--additional synatax for kmonad
	use("kmonad/kmonad-vim")

	-- LITE
	-- use({ "ldelossa/litee.nvim" })
	-- use({ "ldelossa/litee-calltree.nvim" })
	-- require("litee.lib").setup({})
	-- require("litee.calltree").setup({})

	----------------
	-----GIT--------
	----------------
	use({ "sindrets/diffview.nvim", opt = true, cmd = "DiffviewOpen" })

	--gitsigns
	use("lewis6991/gitsigns.nvim")
	require("gitsigns").setup()

	------------------------------
	--~~Personal Organization ~~--
	------------------------------
	-- VimWiki
	-- use({ "vimwiki/vimwiki" })
	-- use({ "tbabej/taskwiki" })
	-- use({ "powerman/vim-plugin-AnsiEsc", opt = true, ft = { "wiki", "vimwiki" } })
	-- use 'chipsenkbeil/vimwiki-server.nvim'
	-- use 'chipsenkbeil/vimwiki.nvim'

	-- Neorg
	-- use({
	-- 	"nvim-neorg/neorg",
	-- 	requires = "nvim-lua/plenary.nvim",
	-- 	config = get_config("neorg"),
	-- })

	-- Taskwarrior
	use("blindFS/vim-taskwarrior")

	-- Spellcheck and grammar
	use({
		"brymer-meneses/grammar-guard.nvim",
		requires = "neovim/nvim-lspconfig",
		config = get_config("grammar-guard"),
	})

	-- this is required for grammar guard
	-- use("williamboman/nvim-lsp-installer")

	--orgmode.nvim

	use({
		"nvim-orgmode/orgmode",
		config = get_config("org-mode"),
	})

	use({
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup({
				symbols = function(default_list)
					table.insert(default_list, "♥")
					return default_list
				end,
			})
		end,
	})

	use({
		"lukas-reineke/headlines.nvim",
		config = function()
			require("headlines").setup()
		end,
	})
	----------------
	-- ~~Docs, Etc--
	----------------
	use("vim-utils/vim-man")
	use("milisims/nvim-luaref")
end)
