return {
	'nvim-lua/plenary.nvim',
	{
		'nvim-telescope/telescope.nvim',
		version = false,
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
