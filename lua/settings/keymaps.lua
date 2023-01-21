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
