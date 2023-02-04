return {
	{
		"abecodes/tabout.nvim",
		dependencies = { "nvim-treesitter", "nvim-cmp" },
		event = "InsertEnter",
		lazy = true,

		config = true,
	},
}
