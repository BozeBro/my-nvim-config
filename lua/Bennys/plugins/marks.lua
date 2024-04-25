return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			local ui = require("harpoon.ui")
			local map = vim.keymap.set
			harpoon.setup()
			map("n", "<leader>m", require("harpoon.mark").add_file, { desc = "[HARPOON] Add mark" })
			map("n", "<leader>tq", ui.toggle_quick_menu, { desc = "[HARPOON] View marks" })
			map("n", "<leader>jj", function()
				ui.nav_file(vim.v.count1)
			end, { desc = "[HARPOON] navigate file i" })

			map("n", "<leader>nn", ui.nav_next, { desc = "[HARPOON] navigate next" })
			map("n", "<leader>np", ui.nav_prev, { desc = "[HARPOON] navigate previous" })
		end,
	},
}
