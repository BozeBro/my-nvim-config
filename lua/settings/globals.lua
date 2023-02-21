local g = vim.g
g.python3_host_prog = "/opt/homebrew/bin/python3"
-- Set completeopt to have a better completion experience
g.completeopt = "menu,menuone,noinsert,noselect"
-- [[ Basic Keymaps ]]
g.mapleader = " "
g.maplocalleader = " "
-- Keep directory as the starting directory
g.netrw_keepdir = 0
-- open files in new buffers without saving changes to disk
g.hidden = true
g["ft"] = true
