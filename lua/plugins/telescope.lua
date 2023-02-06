return {
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		version = false,
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "File grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
			{ "<leader>fo", '<cmd>lua require"telescope.builtin".oldfiles()<cr>', desc = { "Find Old files" } },
			{ "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "File grep in current buffer" },
			{ "<leader>sk", '<cmd>lua require"telescope.builtin".keymaps()<cr>', desc = { "Search Keymaps" } },
			{ "<leader>ts", "<cmd>Telescope<cr>", desc = { "Open Telescope" } },
			{ "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
			{ "<leader>bf", "<cmd>Telescope file_browser<cr>", { desc = "File Browser", noremap = true } },
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
			extensions = {
				file_brower = {
					hijack_netrw = true,
				},
			},
		},
		config = function(_, opts)
			local tele = require("telescope")
			---@diagnostic disable-next-line: missing-parameter
			tele.setup(opts)
			tele.load_extension("fzf")
			tele.load_extension("file_browser")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
	},
}
