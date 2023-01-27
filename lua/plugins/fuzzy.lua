return {
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "File grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
			{ "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "File grep in current buffer" },
			{ "<leader>fo", '<cmd>lua require"telescope.builtin".oldfiles()<cr>', desc = { "Find Old files" } },
			{ "<leader>sk", '<cmd>lua require"telescope.builtin".keymaps()<cr>', desc = { "Search Keymaps" } },
			{ "<leader>ts", "<cmd>Telescope<cr>", desc = { "Open Telescope" } },
		},
		dependencies = {
			{ "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = "make", name = "fzf" },
		},
		opts = {
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
			},
		},
		config = function(_, opts)
			local tele = require("telescope")
			---@diagnostic disable-next-line: missing-parameter
			tele.setup(opts)
			tele.load_extension("fzf")
		end,
	},
}
