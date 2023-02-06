return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm",
		},
		config = function(_, opts)
			require("tokyonight").load(opts)
		end,
	},
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "nvim-tree/nvim-web-devicons", lazy = true, config = true },
	{ "tpope/vim-surround", event = "BufEnter", lazy = false },
	{ "tpope/vim-repeat", event = "BufEnter", lazy = true },
	{ "windwp/nvim-autopairs", opts = {}, lazy = true, event = "InsertEnter", config = true },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPost",
		opts = {
			char = "|",
			show_trailing_blankline_indent = false,
		},
	},
}
