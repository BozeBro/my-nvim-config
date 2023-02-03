local opt = vim.opt
opt.shiftwidth = 4 -- My nice python shiftwidth
opt.showmode = false -- lualine shows mode
opt.tabstop = 4 -- Number of spaces tabs are for
opt.list = true -- Show invisible characters like <tab>
opt.expandtab = true -- Use Spaces instead of tabs
opt.grepprg = "rg --vimgrep" -- Use rg instead of standard grep
<<<<<<< Updated upstream
opt.spelllang = { "en" } -- Spelling language is english
opt.spell = true -- Spell check is turned on
opt.cursorline = true -- Highlight the current cursor line
opt.clipboard = "unnamedplus" -- set generic clipboard for copy paste with "+y
vim.g.python3_host_prog = 0
=======
opt.spelllang = { "en" }
opt.spell = true
vim.cmd([[ set clipboard=unnamedplus ]])
>>>>>>> Stashed changes
opt.autochdir = true
