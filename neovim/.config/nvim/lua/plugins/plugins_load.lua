vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	----------------------
	---~~[Editing Actions~]~
	----------------------
	local refactor = require("refactoring")
	refactor.setup({})

	-- telescope refactoring helper
	local function refactor(prompt_bufnr)
		local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
		require("telescope.actions").close(prompt_bufnr)
		require("refactoring").refactor(content.value)
	end
	-- for the sake of simplicity in this example
	-- you can extract this function and the helper above
	-- and then require the file and call the extracted function
	-- in the mappings below
	M = {}
	M.refactors = function()
		local opts = require("telescope.themes").get_cursor() -- set personal telescope options
		require("telescope.pickers").new(opts, {
			prompt_title = "refactors",
			finder = require("telescope.finders").new_table({
				results = require("refactoring").get_refactors(),
			}),
			sorter = require("telescope.config").values.generic_sorter(opts),
			attach_mappings = function(_, map)
				map("i", "<CR>", refactor)
				map("n", "<CR>", refactor)
				return true
			end,
		}):find()
	end

	vim.api.nvim_set_keymap(
		"v",
		"<Leader>re",
		[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
		{ noremap = true, silent = true, expr = false }
	)
	vim.api.nvim_set_keymap(
		"v",
		"<Leader>rf",
		[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
		{ noremap = true, silent = true, expr = false }
	)
	vim.api.nvim_set_keymap(
		"v",
		"<Leader>rt",
		[[ <Esc><Cmd>lua M.refactors()<CR>]],
		{ noremap = true, silent = true, expr = false }
	)

	-- Misc
	--use 'scrooloose/nerdommenter'

	-- Code Formatting
	use("junegunn/vim-easy-align")
	use("machakann/vim-sandwich")
	use("raimondi/delimitmate") -- look into jiangmiao/auto-pairs
	use({ "sbdchd/neoformat" })
	-- use 'b3nj5m1n/kommentary'
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				colors = {
					error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
					warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
					info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
					hint = { "LspDiagnosticsDefaultHint", "#10B981" },
					default = { "Identifier", "#7C3AED" },
				},
			})
		end,
	})

	----------------------
	---~~Navigation~~---
	----------------------

	--Misc
	use("tpope/vim-unimpaired")
	use("folke/which-key.nvim")
	use("unblevable/quick-scope")
	use("phaazon/hop.nvim")
	use("liuchengxu/vista.vim")
	use({ "ms-jpq/chadtree", branch = "chad", run = ":CHADdeps", opt = true, cmd = "CHADopen" })
	use("folke/trouble.nvim")
	use({ "simnalamburt/vim-mundo", opt = true, cmd = "MundoToggle" })
	use("simeji/winresizer")
	--use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	--Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- TODO - get nvim worktree going
	--FZF
	use({ "junegunn/fzf.vim", requires = { "junegunn/fzf", run = "cd ~/.fzf && ./install --all" } })

	--wildermenu
	use({ "gelguy/wilder.nvim", run = ":UpdateRemotePlugins" })
	----------------
	---~~[[LSP]]~~--
	----------------
	use("tami5/lspsaga.nvim")
	use("neovim/nvim-lspconfig")
	use("nvim-lua/lsp_extensions.nvim")
	use("nvim-lua/plenary.nvim")
	use("ray-x/lsp_signature.nvim")

	----------------------
	---~~[[Treesitter]]~~---
	----------------------
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground", opt = true, cmd = "TSPlaygroundToggle" })
	--use {'windwp/nvim-ts-autotag', opt=true, ft={'html','javascripttreact'}}

	use({ "ThePrimeagen/refactoring.nvim" })

	----------------------
	---~~[AutoComplete]~~---
	----------------------
	--CMP Stuff
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use({ "kdheepak/cmp-latex-symbols", opt = true, ft = { "latex", "tex", "texmf" } })
	use({ "pontusk/cmp-vimwiki-tags", opt = true, ft = { "wiki", "vimwiki" } })

	----------------------
	---~~[Snippets]~~-------
	------------------- --
	use("SirVer/ultisnips")
	use("honza/vim-snippets")
	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")

	-------------------
	--~~ Debugging ~~--
	-------------------
	use({ "mfussenegger/nvim-dap-python" })
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use({ "sakhnik/nvim-gdb", opt = true, ft = { "c", "cpp" } })
	------------
	--~~[HTML]~~--
	------------

	use({ "mattn/emmet-vim", opt = true, ft = { "html" } })
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
	----------------
	--~~Python~~----
	----------------

	----------------
	----~~Rust~~----
	----------------
	use({ "simrat39/rust-tools.nvim" })

	---------------------
	---~~Javascript~~-----
	---------------------
	use({ "mlaursen/vim-react-snippets", opt = true, ft = { "javascript", "javascripttreact" } })

	----------------
	---~~Java~~-----
	----------------
	use({ "mfussenegger/nvim-jdtls", opt = true, ft = { "java" } })
	----------------
	--~~LaTeX~~--
	----------------
	use({ "lervag/vimtex", opt = true, ft = { "latex", "tex" } })

	----------------
	-----Lua--------
	----------------
	use({ "folke/lua-dev.nvim" })

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
	use({ "ulwlu/elly.vim" })
	use({ "EdenEast/nightfox.nvim" })
	use({ "NTBBloodbath/doom-one.nvim" })
	use({ "ellisonleao/gruvbox.nvim" })
	use("rmehri01/onenord.nvim")
	use("catppuccin/nvim")
	use("ful1e5/onedark.nvim")

	-- Focus
	use({ "Pocco81/TrueZen.nvim" })
	use({ "folke/twilight.nvim" })

	-- Coloration, Highlighting, Icons, Readability
	use("markonm/traces.vim")
	use("p00f/nvim-ts-rainbow")
	use("ryanoasis/vim-devicons")
	use("yggdroot/indentline")
	use("luukvbaal/stabilize.nvim")
	use("onsails/lspkind-nvim")

	--UI/UX Elements
	use("voldikss/vim-floaterm")
	use("nvim-lualine/lualine.nvim")
	use("romgrk/barbar.nvim")
	use({ "nvim-lua/popup.nvim", opt = true })
	use("kyazdani42/nvim-web-devicons")

	--nvim GPS
	use {
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter"
	}
	require("nvim-gps").setup()

	----------------
	-----GIT--------
	----------------
	use({ "sindrets/diffview.nvim", opt = true, cmd = "DiffviewOpen" })
	use("lewis6991/gitsigns.nvim")

	------------------------------
	--~~Personal Organization ~~--
	------------------------------
	-- VimWiki
	use({ "vimwiki/vimwiki" })
	use({ "tbabej/taskwiki" })
	use({ "powerman/vim-plugin-AnsiEsc", opt = true, ft = { "wiki", "vimwiki" } })
	-- use 'chipsenkbeil/vimwiki-server.nvim'
	-- use 'chipsenkbeil/vimwiki.nvim'

	-- Neorg
	use({
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				-- Tell Neorg what modules to load
				load = {
					["core.defaults"] = {}, -- Load all the default modules
					["core.norg.concealer"] = {}, -- Allows for use of icons
					["core.norg.dirman"] = { -- Manage your directories with Neorg
						config = {
							workspaces = {
								my_workspace = "~/neorg",
							},
						},
					},
				},
			})
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

	parser_configs.norg = {
		install_info = {
			url = "https://github.com/nvim-neorg/tree-sitter-norg",
			files = { "src/parser.c", "src/scanner.cc" },
			branch = "main",
		},
	}
	-- opt=true, cmd={'Neorg', "NeorgStart"}} -- optional start params for figure out

	-- Taskwarrior
	use("blindFS/vim-taskwarrior")

	-- Spellcheck and grammar
	use({
		"brymer-meneses/grammar-guard.nvim",
		requires = "neovim/nvim-lspconfig",
	})
	-- this is required for grammar guard
	use("williamboman/nvim-lsp-installer")

	--orgmode.nvim
	-- init.lua

	use({
		"nvim-orgmode/orgmode",
		config = function()
			require("orgmode").setup({})
		end,
	})

	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.org = {
		install_info = {
			url = "https://github.com/milisims/tree-sitter-org",
			revision = "main",
			files = { "src/parser.c", "src/scanner.cc" },
		},
		filetype = "org",
	}

	require("nvim-treesitter.configs").setup({
		-- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
		highlight = {
			enable = true,
			disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
			additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
		},
		ensure_installed = { "org" }, -- Or run :TSUpdate org
	})

	require("orgmode").setup({
		org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
		org_default_notes_file = "~/Dropbox/org/refile.org",
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

	----------------
	-- ~~Docs, Etc--
	----------------
	use("vim-utils/vim-man")
	use("milisims/nvim-luaref")
end)
