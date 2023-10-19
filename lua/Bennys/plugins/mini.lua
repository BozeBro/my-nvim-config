return {
	-- indent guides for Neovim
	-- Stolen from LazyVim
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		main = "ibl",
		event = "BufReadPost",
		-- Look at this new indent-blankline feature stuff
		opts = {
			-- char = "▏",
			-- char = "│",
			-- filetype_exclude = { "help", "alpha", "dashboard", "lazy" },
			-- show_trailing_blankline_indent = false,
			-- :help ibl.config.scope.enabled
			-- show_current_context = false,
		},
	},
	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		enabled = false,
		event = "BufReadPre",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "lazy", "mason" },
				callback = function()
					---@diagnostic disable-next-line: inject-field
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
}
