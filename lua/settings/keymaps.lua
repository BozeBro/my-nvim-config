local map = vim.keymap.set
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map({ "n", "v" }, "<leader>q", "<cmd>q<cr>", { desc = "Quit Vim" })
map({ "n", "v" }, "<leader>w", "<cmd>w<cr>", { desc = "Save Vim" })
map({ "n", "v" }, "<leader>zq", "<cmd>q!<cr>", { desc = "Quit w/e saving" })

-- Resize the screen
map({ "n", "v" }, "<C-c>", "<cmd>vertical resize +5<cr>", { desc = "Increase screen size" })
map({ "n", "v" }, "<C-x>", "<cmd>vertical resize -5<cr>", { desc = "Decrease screen size" })

map("n", "<leader>e", "<cmd>Telescope file_browser<cr>", { desc = "Open File Explorer" })
map("n", "<leader>ve", "<C-w>v", { desc = "Open Split Window" })

map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle Vertical Terminal" })

map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Go to next Buffer" })
map("n", "<leader>bb", "<cmd>bprev<cr>", { desc = "Go to previous Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close current buffer" })
function EscapePair()
	local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
	local line = vim.api.nvim_get_current_line()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local after = line:sub(col + 1, -1)
	local closer_col = #after + 1
	local closer_i = nil
	for i, closer in ipairs(closers) do
		local cur_index, _ = after:find(closer)
		if cur_index and (cur_index < closer_col) then
			closer_col = cur_index
			closer_i = i
		end
	end
	if closer_i then
		vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
	else
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
	end
end

vim.api.nvim_set_keymap("i", "<C-l>", "<cmd>lua EscapePair()<CR>", { noremap = true, silent = true })
map({ "i", "t" }, "<C-[>", "<Esc>", { desc = "Escape vim", silent = true, noremap = true })
-- map("n", "<C-[>", "i", { desc = "Enter Insert Mode" })
