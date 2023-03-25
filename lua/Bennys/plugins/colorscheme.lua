return {
	{
		"folke/tokyonight.nvim",
		-- lazy = false,
		lazy = true,
		-- priority = 1000,
		opts = {
			style = "storm",
			-- transparent = true,
		},
		config = function(_, opts)
			require("tokyonight").load(opts)
		end,
	},
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{
		"https://github.com/catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		opts = {
			flavour = "macchiato",
			-- flavour = "latte",
			-- transparent_background = true,
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = true,
		config = function()
			require("nordic").load()
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function(_, opts)
			require("kanagawa").load("wave")
			require("kanagawa").setup(opts)
		end,
	},
}
