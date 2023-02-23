---@diagnostic disable: deprecated
-- TODO replace deprecated statusline
return {
	{
		"nvim-lualine/lualine.nvim",
		-- config = true,
		config = function()
			require("lualine").setup({
				sections = {
					lualine_x = {
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
				},
			})
		end,
		event = "BufReadPre",
	},
}
