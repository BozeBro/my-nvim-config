return {
	{"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {"c", "vim", "help", "lua", "cpp", "go", "python", "javascript", "typescript"},
		sync_install = false,
		highlight = { enable = true },
	},
	config = function(plugin, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
},
}
