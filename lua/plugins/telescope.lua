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
			{ "<leader>fo", '<cmd>lua require"telescope.builtin".oldfiles()<cr>', { desc = "Find Old files" } },
			{
				"<leader>/",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				{ desc = "File grep in current buffer" },
			},
			{ "<leader>sk", '<cmd>lua require"telescope.builtin".keymaps()<cr>', { desc = "Search Keymaps" } },
			{ "<leader>ts", "cmdTelescopecr", desc = { "Open Telescope" } },
			{ "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
			{
				"<leader>bf",
				"<cmd>Telescope file_browser<cr>",
				{ desc = "File Browser", noremap = true },
			},
			{ "<leader>ft", "<cmd>lua require'telescope.builtin'.treesitter()<cr>", { desc = "Treesitter" } },
		},
		dependencies = {
			{ "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = "make", name = "fzf" },
			{ "nvim-telescope/telescope-file-browser.nvim", name = "file_browser" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
			},
			mappings = {},
			extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					depth = false,
				},
				path = "%:p:h",
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
	{ "nvim-telescope/telescope-file-browser.nvim", name = "file_browser" },
}
