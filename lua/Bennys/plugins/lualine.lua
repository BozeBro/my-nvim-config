---@diagnostic disable: deprecated
-- Will probably delete lualine sometime in the future. I don't really need it besides recording
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "folke/noice.nvim" },
		config = function()
			-- local wpm = require("wpm")
			require("lualine").setup({
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						-- "filename",
						-- "filetype",
						{
							require("noice").api.status.mode.get,
							cond = require("noice").api.status.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
					-- lualine_x = { wpm.wpm },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
		event = "BufReadPre",
	},
}
