local map = vim.keymap.set
return {
	{
		"ibhagwan/fzf-lua",
		enabled = true,
		-- lazy = true,
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua")
			map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fast FZF" })
			map("n", "<leader>fg", "<cmd>FzfLua grep<cr>", { desc = "Fast FZF grep" })
			map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Fast FZF buffers" })
			map("n", "<leader>/", "<cmd>FzfLua lgrep_curbuf<cr>", { desc = "Fast FZF live grep current buffer" })
			map(
				"n",
				"<leader>ft",
				"<cmd>FzfLua lsp_document_symbols<cr>",
				{ desc = "Fast FZF lsp document symbols (treesitter like)" }
			)
		end,
	},
}
