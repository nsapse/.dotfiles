return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.keybinds"] = {
					config = {
						hook = function(keybinds)
							keybinds.remap_event("norg", { "n", "i" }, "<S-CR>", "core.itero.next-iteration")
						end,
					},
				}, -- Loads default behaviour

                ["core.concealer"] = {
                    config = {

                    icon_preset = "diamond", -- Adds pretty icons to your documents
                    },
                },
				-- ["core.completion"] = { engine = "nvim-cmp", name = "[Neorg]" }, -- Completion
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},
				["core.integrations.nvim-cmp"] = {},
			},
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
