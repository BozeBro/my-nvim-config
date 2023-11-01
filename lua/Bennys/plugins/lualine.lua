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
					lualine_a = { "mode" },
					lualine_b = {
						{
							"g:syncing",
							cond = function()
								local path = vim.fn.getcwd() .. "/.nvim/rsync.json"
								local file = io.open(path, "r")
								return file ~= nil
							end,
						},
						-- "filename",
					},
					lualine_c = {
						"branch",
						{
							"filename",
							path = 1,
						},
						-- "filetype",
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
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
