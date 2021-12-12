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
