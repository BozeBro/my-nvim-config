return {
	{ "nvim-tree/nvim-web-devicons", lazy = true, config = true },
	{ "tpope/vim-surround", event = "BufEnter", lazy = false },
	{ "tpope/vim-repeat", event = "BufEnter", lazy = true },
	{ "lewis6991/gitsigns.nvim", event = "BufReadPre", config = true },
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>tl", "<cmd>LazyGit<cr>", { desc = "Open LazyGit", silent = true } },
			{ "<leader>lc", "<cmd>LazyGitConfig<cr>", { desc = "Open LazyGit Config", silent = true } },
		},
	},
}
