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

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}
-- opt=true, cmd={'Neorg', "NeorgStart"}} -- optional start params for figure out
