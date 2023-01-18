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
}
