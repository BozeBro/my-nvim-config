return {
	{
		"akinsho/toggleterm.nvim",
		enabled = false,
		version = "*",
		opts = {
			open_mapping = [[<c-\>]],
			direction = "vertical",
			size = 80,
		},
		lazy = true,
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			{
				"<leader>tf",
				"<cmd>ToggleTerm direction=float<cr>",
				{ desc = "Toggle Float Terminal" },
			},
			{
				"<leader>th",
				"<cmd>ToggleTerm direction=horizontal size=20<cr>",
				{ desc = "Toggle Horizontal Terminal" },
			},
			{
				"<leader>tv",
				"<cmd>ToggleTerm size=80 direction=vertical <cr>",
				{ desc = "Toggle Vertical Terminal" },
			},
			{
				"<leader>tt",
				"<cmd>ToggleTerm direction=tab <cr>",
				{ desc = "Toggle Tabbed Terminal" },
			},
		},
	},
}
