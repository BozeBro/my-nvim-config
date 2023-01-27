return {
	{ "folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{ "ellisonleao/gruvbox.nvim" },
	{ 'nvim-tree/nvim-web-devicons',
		config = true, },
		{"tpope/vim-surround"},
		{"tpope/vim-repeat"},
		{"windwp/nvim-autopairs",
        opts = {
        },
        config = true},
		{
			"lukas-reineke/indent-blankline.nvim",
			opts = {
				char = '|',
				show_trailing_blankline_indent = false,
			},
		},
}
