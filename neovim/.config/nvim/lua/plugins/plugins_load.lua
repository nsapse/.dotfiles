vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	----------------------
	---~~[Editing Actions~]~
	----------------------
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

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

	-- which_key
	use("folke/which-key.nvim")
	local wk = require("which-key")
	require("which-key").setup({
		timeoutlen = 0,
	})
	use("unblevable/quick-scope")

	-- Hop
	use("phaazon/hop.nvim")
	require("hop").setup()

	-- Vist
	use("liuchengxu/vista.vim")
	-- chadtree
	use({ "ms-jpq/chadtree", branch = "chad", run = ":CHADdeps", opt = true, cmd = "CHADopen" })

	-- Trouble
	use("folke/trouble.nvim")
	require("trouble").setup({})

	use({ "simnalamburt/vim-mundo", opt = true, cmd = "MundoToggle" })
	use("simeji/winresizer")
	--use {'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu'}

	--Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	require("telescope").setup({
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	})

	require("telescope").load_extension("fzf")

	-- TODO - get nvim worktree going
	--FZF
	use({ "junegunn/fzf.vim", requires = { "junegunn/fzf", run = "cd ~/.fzf && ./install --all" } })

	--wildermenu
	use({ "gelguy/wilder.nvim", run = ":UpdateRemotePlugins" })
	----------------
	---~~[[LSP]]~~--
	----------------

	--LSPConfig Setup
	local lspconfig = require("lspconfig")

	require("lspconfig").bashls.setup({})
	-- require'lspconfig'.ccls.setup{}
	require("lspconfig").clangd.setup({})
	require("lspconfig").cssls.setup({})
	require("lspconfig").gopls.setup({})
	require("lspconfig").hls.setup({})
	require("lspconfig").html.setup({})
	require("lspconfig").jsonls.setup({})
	require("lspconfig").pyright.setup({})
	-- require'lspconfig'.pylsp.setup{}
	-- require'lspconfig'.jedi_language_server.setup{}
	require("lspconfig").sqls.setup({})
	require("lspconfig").tsserver.setup({})
	require("lspconfig").vimls.setup({})
	require("lspconfig").texlab.setup({})

	--Saga
	use("tami5/lspsaga.nvim")
	local saga = require("lspsaga")
	saga.init_lsp_saga()

	--LSPconfig
	use("neovim/nvim-lspconfig")

	use("nvim-lua/lsp_extensions.nvim")
	use("nvim-lua/plenary.nvim")

	-- lsp_signature
	use("ray-x/lsp_signature.nvim")
	require("lsp_signature").setup()

	----------------------
	---~~[[Treesitter]]~~---
	----------------------
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground", opt = true, cmd = "TSPlaygroundToggle" })
	--use {'windwp/nvim-ts-autotag', opt=true, ft={'html','javascripttreact'}}

	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Treesitter
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"comment",
			"css",
			"go",
			"html",
			"java",
			"javascript",
			"json",
			"latex",
			"llvm",
			"norg",
			"org",
			"python",
			"regex",
			"ruby",
			"rust",
			"toml",
			"typescript",
			"vim",
			"yaml",
		}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		ignore_install = {}, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = { "org" }, -- list of language that will be disabled
			additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil,
		},
		autotag = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		indent = {
			enable = true,
		},
		context_commentstring = {
			enable = true,
		},
	})

	----------------------
	---~~[Snippets]~~-------
	------------------- --
	use("SirVer/ultisnips")
	use("honza/vim-snippets")
	use("rafamadriz/friendly-snippets")

	--luasnip
	use("L3MON4D3/LuaSnip")
	local luasnip = require("luasnip")
	-- Load Snippets into Luasnip
	require("luasnip/loaders/from_vscode").lazy_load()

	----------------------
	---~~[AutoComplete]~~---
	----------------------
	--CMP Stuff

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use({ "kdheepak/cmp-latex-symbols", opt = true, ft = { "latex", "tex", "texmf" } })
	use({ "pontusk/cmp-vimwiki-tags", opt = true, ft = { "wiki", "vimwiki" } })

	-- lspkind to make it prettier
	use("onsails/lspkind-nvim")
	local lspkind = require("lspkind")

	-- cmp setup
	use("hrsh7th/nvim-cmp")
	local cmp = require("cmp")

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},

		mapping = {
			--['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's','c'}),
			--['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's','c'}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<Space>"] = cmp.mapping(cmp.mapping.confirm(), { "c" }),
			--['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<S-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<S-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
		},

		formatting = {
			format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
		},

		--[[ completion = { autocomplete = false,
	}, ]]

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			--{ name = 'vsnip' }, -- For vsnip users.
			{ name = "vimwiki-tags" }, -- For vimwiki
			{ name = "latex_symbols" }, -- For vimwiki
			{ name = "buffer" },
			{ name = "luasnip" }, -- For luasnip users.
			{ name = "ultisnips" }, -- For ultisnips users.
			{ name = "path" },
			{ name = "orgmode" },
		}),
	})

	-- Setup lspconfig.
	local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	require("lspconfig")["pyright"].setup({
		capabilities = capabilities,
	})
	require("lspconfig")["clangd"].setup({
		capabilities = capabilities,
	})
	require("lspconfig")["vimls"].setup({
		capabilities = capabilities,
	})

	-------------------
	--~~ Debugging ~~--
	-------------------
	use({ "mfussenegger/nvim-dap-python" })
	-- setup nvim DAP
	use("mfussenegger/nvim-dap")
	local dap = require("dap")

	vim.fn.sign_define("DapBreakpoint", { text = ">>", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "<>", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "->", texthl = "", linehl = "", numhl = "" })

	dap.adapters.lldb = {
		type = "executable",
		command = "/usr/bin/lldb-vscode", -- adjust as needed
		name = "lldb",
	}

	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "lldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},

			-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
			--
			--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
			--
			-- Otherwise you might get the following error:
			--
			--    Error on launch: Failed to attach to the target process
			--
			-- But you should be aware of the implications:
			-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
			runInTerminal = false,
		},
	}

	-- If you want to use this for rust and c, add something like this:

	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp

	require("dapui").setup()

	dap.adapters.python = {
		type = "executable",
		command = "/usr/bin/python",
		args = { "-m", "debugpy.adapter" },
	}

	dap.configurations.python = {
		{
			-- The first three options are required by nvim-dap
			type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
			request = "launch",
			name = "Launch file",

			-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

			program = "${file}", -- This configuration will launch the current file if used.
			pythonPath = function()
				-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
				-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
				-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
				local cwd = vim.fn.getcwd()
				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
					return cwd .. "/venv/bin/python"
				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"
				else
					return "/usr/bin/python"
				end
			end,
		},
	}

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

	require("rust-tools").setup({})
	-- set inlay hints
	require("rust-tools.inlay_hints").set_inlay_hints()
	-- Command: RustHoverActions
	require("rust-tools.hover_actions").hover_actions()

	---------------------
	---~~Javascript~~-----
	---------------------
	use({ "mlaursen/vim-react-snippets", opt = true, ft = { "javascript", "javascripttreact" } })

	----------------
	---~~Java~~-----
	----------------
	use({ "mfussenegger/nvim-jdtls", opt = true, ft = { "java" } })
	require("lspconfig").jdtls.setup({ cmd = { "jdtls" } })
	----------------
	--~~LaTeX~~--
	----------------
	use({ "lervag/vimtex", opt = true, ft = { "latex", "tex" } })

	----------------
	-----Lua--------
	----------------
	use({ "folke/lua-dev.nvim" })

	local luadev = require("lua-dev").setup({
		lspconfig = {
			cmd = { "lua-language-server" },
		},
	})

	lspconfig.sumneko_lua.setup(luadev)
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

	--UI/UX Elements
	use("voldikss/vim-floaterm")
	use("nvim-lualine/lualine.nvim")
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_lsp", "coc" } } },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = { "tabs" },
			lualine_b = {},
			-- lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = { "chadtree", "quickfix" },
	})


	-- BarBar
	use("romgrk/barbar.nvim")

	vim.g.bufferline = {
		-- Enable/disable animations
		animation = true,

		-- Enable/disable auto-hiding the tab bar when there is a single buffer
		auto_hide = false,

		-- Enable/disable current/total tabpages indicator (top right corner)
		tabpages = true,

		-- Enable/disable close button
		closable = true,

		-- Enables/disable clickable tabs
		--  - left-click: go to buffer
		--  - middle-click: delete buffer
		clickable = true,

		-- Excludes buffers from the tabline
		exclude_ft = { "javascript" },
		exclude_name = { "package.json" },

		-- Enable/disable icons
		-- if set to 'numbers', will show buffer index in the tabline
		-- if set to 'both', will show buffer index and icons in the tabline
		icons = true,

		-- If set, the icon color will follow its corresponding buffer
		-- highlight group. By default, the Buffer*Icon group is linked to the
		-- Buffer* group (see Highlighting below). Otherwise, it will take its
		-- default value as defined by devicons.
		icon_custom_colors = false,

		-- Configure icons on the bufferline.
		icon_separator_active = "▎",
		icon_separator_inactive = "▎",
		icon_close_tab = "",
		icon_close_tab_modified = "●",
		icon_pinned = "車",

		-- If true, new buffers will be inserted at the start/end of the list.
		-- Default is to insert after current buffer.
		insert_at_end = false,
		insert_at_start = false,

		-- Sets the maximum padding width with which to surround each tab
		maximum_padding = 1,

		-- Sets the maximum buffer name length.
		maximum_length = 30,

		-- If set, the letters for each buffer in buffer-pick mode will be
		-- assigned based on their name. Otherwise or in case all letters are
		-- already assigned, the behavior is to assign letters in order of
		-- usability (see order below)
		semantic_letters = true,

		-- New buffer letters are assigned in this order. This order is
		-- optimal for the qwerty keyboard layout but might need adjustement
		-- for other layouts.
		letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

		-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
		-- where X is the buffer number. But only a static string is accepted here.
		no_name_title = nil,
	}
	use({ "nvim-lua/popup.nvim", opt = true })
	use("kyazdani42/nvim-web-devicons")

	--nvim GPS
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	require("nvim-gps").setup()

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

	-- Starting Grammar Guard
	--[[ require("grammar-guard").init()
	require("lspconfig").grammar_guard.setup({
		settings = {
			ltex = {
				enabled = { "latex", "tex", "bib", "markdown" },
				language = "en",
				diagnosticSeverity = "information",
				setenceCacheSize = 2000,
				additionalRules = {
					enablePickyRules = true,
					motherTongue = "en",
				},
				trace = { server = "verbose" },
				dictionary = {},
				disabledRules = {},
				hiddenFalsePositives = {},
			},
		},
	}) ]]

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
