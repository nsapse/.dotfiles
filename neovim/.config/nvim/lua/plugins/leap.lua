return {
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
			require("leap-spooky").setup()
			require("flit").setup()
		end,
	},
	"ggandor/leap-spooky.nvim",
	"ggandor/flit.nvim",
}
