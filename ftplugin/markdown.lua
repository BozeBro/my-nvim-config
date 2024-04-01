local obsidian = require("obsidian")
local settings = require("util")
local keys = {
	{
		"n",
		"gd",
		function()
			if obsidian.util.cursor_on_markdown_link() then
				local cmd = "<cmd>ObsidianFollowLink<cr>"
				return cmd
			else
				return "gd"
			end
		end,
		{ noremap = false, expr = true },
	},
	{
		"n",
		"<leader><leader>",
		function()
			return "<cmd>ObsidianToday<cr>"
		end,
		{ noremap = true, expr = true },
	},
	{
		"n",
		"<leader>n",
		":ObsidianNew ",
		{ noremap = true },
	},
}
settings.mapKeys(keys)
