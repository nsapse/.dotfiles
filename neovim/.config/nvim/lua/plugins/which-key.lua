require("which-key").setup({
	timeoutlen = 250,
	window = {
		border = "single",
	},
	triggers_blacklist = {
		n = { "h", "j", "k", "l", '"' },
		v = { "h", "j", "k", "l", '"' },
	},
})

-- register leader keys
-- local wk = require('which_key')
--[[ wk.register({
		["leader"] = {
			e = {
				name = "edit",
				c = "config",
				lc = "lua config",
			},
			s = {
				name = "Scope (Telescope)",
				f = { "find file" },
				t = { "browse todos" },
				b = { "browse buffers" },
			},
			t = {
				name = "Tab",
				n = { "new" },
				c = { "close" },
			},
			w = {
				name = "Window",
				h = "left",
				j = "up",
				k = "down",
				l = "right",
				c = "close",
			},
		},
		g = {
			name = "Go To",
			d = "definition",
			D = "declaration",
			f = "file (under cursor)",
			i = "implementation",
			r = "references",
		},
	}) ]]
