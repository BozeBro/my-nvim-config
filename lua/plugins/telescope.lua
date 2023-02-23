return {
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		-- lazy = true,
		-- lazy = true,
		-- cmd = "Telescope",
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
					use_fd = false,
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
			tele.load_extension("notify")
			tele.load_extension("noice")
			require("telescope").load_extension("zoxide")
			tele.load_extension("repo")
			local g = require("util").global
			-- Playtest for now
			-- Change direct when opening a new project
			g["rooter_cd_cmd"] = "lcd"
			vim.keymap.set("n", "<leader>cd", "<cmd>Telescope zoxide list<cr>", { desc = "Cd into directory" })

			vim.keymap.set("n", "<leader>rl", "<cmd>Telescope repo list<cr>", { desc = "open repositories" })
		end,
	},
	{ "cljoly/telescope-repo.nvim", lazy = true, dependencies = { "vim-rooter" } },
	{ "jvgrootveld/telescope-zoxide", lazy = true },
	{ "airblade/vim-rooter", lazy = true },
}
