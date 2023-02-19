local o = vim.o
local wo = vim.wo

wo.number = true

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
o.signcolumn = "yes"

-- Set colorscheme
o.termguicolors = true
-- Options for which-key defaults
vim.o.timeout = true
vim.o.timeoutlen = 300
