return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = nil, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				-- init = function()
				-- 	-- PERF: no need to load the plugin, if we only need its queries for mini.ai
				-- 	local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
				-- 	local opts = require("lazy.core.plugin").values(plugin, "opts", false)
				-- 	local enabled = false
				-- 	if opts.textobjects then
				-- 		for _, mod in ipairs({
				-- 			"move",
				-- 			"select",
				-- 			"swap",
				-- 			"lsp_interop",
				-- 		}) do
				-- 			if opts.textobjects[mod] and opts.textobjects[mod].enable then
				-- 				enabled = true
				-- 				break
				-- 			end
				-- 		end
				-- 	end
				-- 	if not enabled then
				-- 		require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
				-- 	end
				-- end,
			},
		},
		opts = {
			highlight = { enable = true },
			indent = { enable = true, disable = { "python" } },
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				"bash",
				"c",
				"html",
				"javascript",
				"java",
				"json",
				"lua",
				"go",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						-- You can optionally set descriptions to the mappings (used in the desc parameter of
						-- nvim_buf_set_keymap) which plugins like which-key display
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						-- @assignment.inner
						-- @assignment.lhs
						-- @assignment.outer
						-- @assignment.rhs
						-- @attribute.inner
						-- @attribute.outer
						-- @block.inner
						-- @block.outer
						-- @call.inner
						-- @call.outer
						-- @class.inner
						-- @class.outer
						-- @comment.inner
						-- @comment.outer
						-- @conditional.inner
						-- @conditional.outer
						-- @frame.inner
						-- @frame.outer
						-- @function.inner
						-- @function.outer
						-- @loop.inner
						-- @loop.outer
						-- @number.inner
						-- @parameter.inner
						-- @parameter.outer
						-- @regex.inner
						-- @regex.outer
						-- @return.inner
						-- @return.outer
						-- @scopename.inner
						-- @statement.outer
					},
				},
			},
		},
		-- rainbow = {
		-- 	enable = true,
		-- 	query = "rainbow-parens",
		-- 	-- Highlight the entire buffer all at once
		-- 	strategy = require("ts-rainbow").strategy.global,
		-- 	-- strategy = rainbow.strategy.global,
		-- 	-- hlgroups = {
		-- 	-- 	"TSRainbowRed",
		-- 	-- 	"TSRainbowYellow",
		-- 	-- 	"TSRainbowBlue",
		-- 	-- 	"TSRainbowOrange",
		-- 	-- 	"TSRainbowGreen",
		-- 	-- 	"TSRainbowViolet",
		-- 	-- 	"TSRainbowCyan",
		-- 	-- },
		-- },
		---@param opts TSConfig
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
	-- "mrjones2014/nvim-ts-rainbow",  // deprecated
	-- { "HiPhish/nvim-ts-rainbow2" }, // deprecated
	{ "HiPhish/rainbow-delimiters.nvim" },
}
