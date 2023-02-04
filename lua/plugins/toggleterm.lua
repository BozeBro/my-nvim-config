return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local toggle = require("toggleterm")
			toggle.setup()
		end,
		lazy = true,
		cmd = { "ToggleTerm", "TermExec" },
		keys = {
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" } },
			{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" } },
			{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical <cr>", { desc = "Toggle Vertical Terminal" } },
			-- { "<leader>tl", "<cmd>TermExec cmd='lazygit' dir=./ direction=float <cr>", { desc = "Toggle Lazygit" } },
		},
	},
}
