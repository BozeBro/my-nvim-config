return {
	{
		"phaazon/hop.nvim",
		event = "VeryLazy",
		lazy = true,
		version = "v2",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
		config = function(_, opts)
			local hop = require("hop")
			hop.setup(opts)
			local map = vim.keymap.set
			map("n", "f", "<cmd>HopChar1<cr>", { desc = "Hop Char" })
			map({ "n", "v" }, "<leader>ha", "<cmd>HopAnywhere<cr>", { desc = "Hop Anywhere" })
			map({ "n", "v" }, "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop Word" })
			map({ "n", "v" }, "<leader>hp", "<cmd>HopPattern<cr>", { desc = "Hop Pattern" })
		end,
	},
}
