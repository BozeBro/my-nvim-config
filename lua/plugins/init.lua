return {
	{
		"folke/tokyonight.nvim",
		-- lazy = false,
		-- priority = 1000,
		opts = {
			style = "night",
			transparent = true,
		},
		config = function(_, opts)
			-- require("tokyonight").load(opts)
			-- require("gruvbox").load()
		end,
	},
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{
		"https://github.com/catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		opts = {
			flavour = "macchiato",
			-- transparent_background = true,
		},
		priority = 1000,
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
	},
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
