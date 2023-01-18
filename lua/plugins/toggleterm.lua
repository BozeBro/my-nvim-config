return {
	{"akinsho/toggleterm.nvim",
	version = '*',
	opts = {shadding_factor=2,
		float_opts = {
			board = "curved",
			highlights = {
				board = "Normal",
				background="Normal"
			},
		},
		size = function(term)
			if term.direction == "vertical" then
				return 60
			end
			return 20
		end,
	},
	config = true, }
}
