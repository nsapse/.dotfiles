local gps = require("nvim-gps")

local function arduino_status()
	local ft = vim.api.nvim_buf_get_option(0, "ft")
	if ft ~= "arduino" then
		return ""
	end
	local port = vim.fn["arduino#GetPort"]()
	local line = string.format("[%s]", vim.g.arduino_board)
	if vim.g.arduino_programmer ~= "" then
		line = line .. string.format(" [%s]", vim.g.arduino_programmer)
	end
	if port ~= 0 then
		line = line .. string.format(" (%s:%s)", port, vim.g.arduino_serial_baud)
	end
	return line
end

return {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
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
					lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
					lualine_c = {
						"filename",
						{ gps.get_location, cond = gps.is_available },
						{ require("NeoComposer.ui").status_recording },
					},
					lualine_x = { "fileformat", "filetype" },
					lualine_y = { "progress", { arduino_status } },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = { "tabs" },
					lualine_b = {},
					-- lualine_c = { "filename" },
					lualine_x = { "location", "encoding" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = { "chadtree", "quickfix" },
			})
		end,
	},
}
