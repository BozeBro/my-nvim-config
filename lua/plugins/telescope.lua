return {
	'nvim-lua/plenary.nvim',
	{
		'nvim-telescope/telescope.nvim',
		version = '0.1.0',
		dependencies = {{"https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = 'make', name='fzf' }},
		config = function(_, opts)
			local tele = require 'telescope'
			---@diagnostic disable-next-line: missing-parameter
			tele.setup(opts)
			tele.load_extension('fzf')
			local builtin = require 'telescope.builtin'
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "File grep" })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help" })
			vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = "search buffer" })

		end
	}
}
