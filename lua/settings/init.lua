local o = vim.o

vim.wo.number = true

-- Set highlight on search
o.hlsearch = false
-- Enable mouse mode
o.mouse = "a"
-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
o.termguicolors = true
-- Set completeopt to have a better completion experience
o.completeopt = "menu,menuone,noselect"

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("settings.options")
require("settings.keymaps")
-- vim.cmd([[let g:opamshare = substitute(system('opam var share'),'\n$','','''')]])
-- vim.cmd([[execute "set rtp+=" . g:opamshare . "/merlin/vim"]])
