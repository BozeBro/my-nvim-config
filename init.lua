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
-- local tele = {
-- 	{ "folke/tokyonight.nvim" },
-- 	{ "nvim-lua/plenary.nvim" },
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		dependencies = {
-- 			{ "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = "make", name = "fzf" },
-- 			{ "nvim-telescope/telescope-file-browser.nvim", name = "file_browser" },
-- 			{ "nvim-lua/plenary.nvim" },
-- 		},
--
-- 		config = function(_, opts)
-- 			local tele = require("telescope")
-- 			tele.setup(opts)
-- 			tele.load_extension("fzf")
-- 			tele.load_extension("file_browser")
-- 		end,
-- 	},
-- }
-- require("lazy").setup(tele)
require("settings")
require("lazy").setup("plugins")
vim.cmd([[colorscheme nordic]])
