vim.wo.number = true

-- Set highlight on search
vim.o.hlsearch = false
-- Enable mouse mode
vim.o.mouse = 'a'
-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

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

--[[ Telescope bindings ]]
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Find Files" })
map('n', '<leader>fg', '<cmd>Telescope find_grep<cr>', { desc = "File grep" })
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = "Find buffer" })
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = "Find help" })
map('n', '<leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = "File grep in current buffer" })

map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', {desc = "Toggle Float Terminal"})
map('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', {desc = "Toggle Horizontal Terminal"})
map('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', {desc = "Toggle Vertical Terminal"})
