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

require("Bennys.settings")
require("lazy").setup("Bennys.plugins")
-- local flat = require("Bennys.plugins.flatten")
-- local util = require("util")
-- util.concatTable(require"Bennys.plugins.colorscheme", flat)
-- util.concatTable(require"Bennys.plugins.toggleterm", flat)
-- require("lazy").setup(flat)
-- require("lazy").setup(m)
vim.cmd([[colorscheme tokyonight]])
