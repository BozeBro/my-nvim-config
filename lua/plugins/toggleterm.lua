return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			local toggle = require("toggleterm")
			toggle.setup()
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
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
