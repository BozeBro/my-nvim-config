return {
	-- {
	--     "phaazon/hop.nvim",
	--     event = "VeryLazy",
	--     lazy = true,
	--     version = "v2",
	--     opts = {
	--         keys = "etovxqpdygfblzhckisuran",
	--     },
	--     config = function(_, opts)
	--         local hop = require("hop")
	--         hop.setup(opts)
	--         local map = vim.keymap.set
	--         map("n", "<leader>f", "<cmd>HopChar1<cr>", { desc = "Hop Char" })
	--         map({ "n", "v" }, "<leader>ha", "<cmd>HopAnywhere<cr>", { desc = "Hop Anywhere" })
	--         map({ "n", "v" }, "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop Word" })
	--         map({ "n", "v" }, "<leader>hp", "<cmd>HopPattern<cr>", { desc = "Hop Pattern" })
	--     end,
	-- },
	{
		"ggandor/leap.nvim",
		event = "BufEnter",
		lazy = true,
		config = function()
			-- local u = require("util")
			-- u.mapKeys({ { "n", "S", "<Nop>", {} } })
			local map = vim.keymap.set
			map("n", "m", "<Plug>(leap-forward-to)")
			map("n", "M", "<Plug>(leap-backward-to)")
		end,
	},
	-- {
	-- 	"ggandor/flit.nvim",
	-- 	event = "BufEnter",
	-- 	dependencies = { "ggandor/leap.nvim" },
	-- 	lazy = true,
	-- 	opts = {
	-- 		keys = { f = "f", F = "F", t = "t", T = "T" },
	-- 		-- A string like "nv", "nvo", "o", etc.
	-- 		labeled_modes = "v",
	-- 		multiline = true,
	-- 		-- Like `leap`s similar argument (call-specific overrides).
	-- 		-- E.g.: opts = { equivalence_classes = {} }
	-- 		opts = {},
	-- 	},
	-- },
}
