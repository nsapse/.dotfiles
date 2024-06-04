return {
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"rcasia/neotest-java",
			"nvim-neotest/nvim-nio",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = function(file)
							if string.find(file, "/packages/") then
								return string.match(file, "(.-/[^/]+/)src") .. "jest.config.js"
							end

							return vim.fn.getcwd() .. "/jest.config.js"
						end,
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
					require("neotest-java"),
				},
			})
		end,
	}
