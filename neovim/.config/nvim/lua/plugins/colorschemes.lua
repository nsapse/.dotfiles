return {
	-- { "mcchrish/zenbones.nvim", dependencies = "rktjmp/lush.nvim" },
	"EdenEast/nightfox.nvim",
	"Murtaza-Udaipurwala/gruvqueen",
	"NTBBloodbath/doom-one.nvim",
	"RRethy/nvim-base16",
	"b4skyx/serenade",
	"catppuccin/nvim",
	"ellisonleao/gruvbox.nvim",
	"fenetikm/falcon",
	"folke/tokyonight.nvim",
	"ful1e5/onedark.nvim",
	"jacoborus/tender.vim",
	"maaslalani/nordbuddy",
	"marko-cerovac/material.nvim",
	"mhartington/oceanic-next",
	"rebelot/kanagawa.nvim",
	"rktjmp/lush.nvim",
	"rmehri01/onenord.nvim",
	"rose-pine/neovim",
	"sainnhe/edge",
	"sainnhe/everforest",
	-- {
	-- 	"neanias/everforest-nvim",
	-- 	version = false,
	-- 	lazy = false,
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	-- Optional; default configuration will be used if setup isn't called.
	-- 	config = function()
	-- 		require("everforest").setup({
	-- 			-- Your config here
	-- 		})
	-- 	end,
	-- },
	"sainnhe/forest-night",
	"sainnhe/gruvbox-material",
	"sainnhe/sonokai",
	"shaunsingh/nord.nvim",
	"savq/melange-nvim",
	"luisiacc/gruvbox-baby",
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
	"JoosepAlviste/palenightfall.nvim",
	"ramojus/mellifluous.nvim",
	"morhetz/gruvbox",
}
