require("telescope").setup({
	defaults = {
		theme = "ivy"
	},
	mappings = {
      n = {
          ['<C-d>'] = require('telescope.actions').delete_buffer
      }, -- n
      i = {
        ['<C-d>'] = require('telescope.actions').delete_buffer
		}
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		file_browser = {
			theme = "ivy",
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown{}
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")
