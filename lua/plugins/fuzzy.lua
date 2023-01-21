return {
	'nvim-lua/plenary.nvim',
	{
		'nvim-telescope/telescope.nvim',
		version = false,
		cmd = "Telescope",
		keys = {
			{'<leader>ff', '<cmd>Telescope find_files<cr>',  desc = "Find Files" },
			{'<leader>fg', '<cmd>Telescope live_grep<cr>',  desc = "File grep" },
			{'<leader>fb', '<cmd>Telescope buffers<cr>',  desc = "Find buffer" },
			{'<leader>fh', '<cmd>Telescope help_tags<cr>',  desc = "Find help" },
			{'<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>',  desc = "File grep in current buffer" },
		},
		dependencies = {{"https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = 'make', name='fzf' }, },
		opts = {theme = 'dropdown'},
		config = function(_, opts)
			local tele = require 'telescope'
			---@diagnostic disable-next-line: missing-parameter
			tele.setup(opts)
			tele.load_extension('fzf')
						-- vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = "search buffer" })

		end
	}
}
