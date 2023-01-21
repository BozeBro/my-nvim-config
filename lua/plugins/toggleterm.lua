return {
	{
	"akinsho/toggleterm.nvim",
	version="*",
	config = true,
	cmd = "ToggleTerm",
	keys = {{'<leader>tf', '<cmd>ToggleTerm direction=float<cr>', {desc = "Toggle Float Terminal"}},
	{'<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', {desc = "Toggle Horizontal Terminal"}},
	{'<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', {desc = "Toggle Vertical Terminal"}},

},
	}
}
