return {
	{
		"phaazon/hop.nvim",
		event = "VeryLazy",
		lazy = true,
		enabled = false,
		version = "v2",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
		config = function(_, opts)
			local hop = require("hop")
			hop.setup(opts)
			local map = vim.keymap.set
			map("n", "<leader>f", "<cmd>HopChar1<cr>", { desc = "Hop Char" })
			map({ "n", "v" }, "<leader>ha", "<cmd>HopAnywhere<cr>", { desc = "Hop Anywhere" })
			map({ "n", "v" }, "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop Word" })
			map({ "n", "v" }, "<leader>hp", "<cmd>HopPattern<cr>", { desc = "Hop Pattern" })
		end,
	},
	{
		"ggandor/leap.nvim",
		-- event = "BufEnter",
		enabled = false,
		lazy = true,
		keys = { "f", "F" },
		config = function()
			local map = vim.keymap.set
			map("n", "f", "<Plug>(leap-forward-to)")
			map("n", "F", "<Plug>(leap-backward-to)")
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		enabled = false,
		---@type Flash.Config
		opts = {},
    -- stylua: ignore
    keys = {
      {
        "S",
        mode = { "n", "o" },
        function() require("flash").treesitter() end,
        desc =
        "Flash Treesitter"
      },
      {
        "r",
        mode = "o",
        function() require("flash").remote() end,
        desc =
        "Remote Flash"
      },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
	},
}
