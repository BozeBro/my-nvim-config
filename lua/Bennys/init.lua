local util = require("util")
vim.g.syncing = util.syncDefault()
require("Bennys.settings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local newOpt = {
	dev = {
		path = "~/.config/plugins",
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
}
local lazy = require("lazy")
-- local plugins = {
-- 	"treesitter",
-- 	-- "bufferline",
-- 	-- "colorscheme",
-- 	-- "lsp",
-- 	-- "cmp",
-- 	-- "null",
-- 	-- "noice",
-- 	-- "telescope",
-- 	-- "autopairs",
-- 	-- "luasnip",
-- }
-- local lua_plugins = {}
-- for index, value in ipairs(plugins) do
-- 	table.insert(lua_plugins, require("Bennys.plugins." .. value))
-- end

-- lazy.setup(lua_plugins)
lazy.setup("Bennys.plugins", newOpt)

vim.api.nvim_create_autocmd({ "DirChanged" }, {
	pattern = "*",
	callback = function()
		vim.cmd([[ call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd)) ]])
	end,
	-- group = "my_other_autocommands",
})
