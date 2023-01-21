local o = vim.o 

vim.wo.number = true

-- Set highlight on search
o.hlsearch = false
-- Enable mouse mode
o.mouse = 'a'
-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Decrease update time
o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
o.termguicolors = true
-- Set completeopt to have a better completion experience
o.completeopt = 'menu,menuone,noselect'

local opt = vim.opt
opt.shiftwidth = 4   -- My nice python shiftwidth
opt.showmode = false -- lualine shows mode
opt.tabstop = 4 -- Number of spaces tabs are for 
opt.list = true -- Show invisible characters like <tab>
opt.expandtab = true -- Use Spaces instead of tabs 
opt.grepprg = 'rg --vimgrep' -- Use rg instead of standard grep
opt.spelllang = { 'en'}
-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local map = vim.keymap.set
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map({ 'n', 'v' }, '<leader>q', '<cmd>q<cr>', { desc = "Quit Vim" })
map({ 'n', 'v' }, '<leader>w', '<cmd>w<cr>', { desc = "Save Vim" })

-- Resize the screen
map({ 'n', 'v' }, '<C-c>', '<C-w>>', { desc = "Increase screen size" })
map({ 'n', 'v' }, '<C-x>', '<C-w><', { desc = "Decrease screen size" })

map('n', '<leader>e', '<cmd>Ex<cr>', { desc = "Open File Explorer" })
map('n', '<leader>ve', '<C-w>v', { desc = 'Open Split Window' })

map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', {desc = "Toggle Float Terminal"})
map('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', {desc = "Toggle Horizontal Terminal"})
map('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', {desc = "Toggle Vertical Terminal"})
