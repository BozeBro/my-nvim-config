local opt = vim.opt
local TabToSpace = 2
opt.shiftwidth = TabToSpace -- My nice python shiftwidth
opt.showmode = false -- lualine shows mode
opt.tabstop = TabToSpace -- Number of spaces tabs are for
opt.list = true -- Show invisible characters like <tab>
opt.expandtab = true -- Use Spaces instead of tabs
opt.grepprg = "rg --vimgrep" -- Use rg instead of standard grep
opt.spelllang = { "en" } -- Spelling language is english
opt.spell = false -- Spell check is turned on
opt.cursorline = true -- Highlight the current cursor line
opt.clipboard = "unnamedplus" -- set generic clipboard for copy paste with "+y
opt.filetype = "unix"
opt["pumheight"] = 7
opt.smartindent = false
-- opt.autochdir = true
