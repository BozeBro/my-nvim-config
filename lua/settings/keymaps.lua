local util = require("util")
local map = util.map
-- Keymaps for better default experience
-- See `:help vim.keymap.set`
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
map("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "Find Notifications" })

map("n", "<leader>vv", "<cmd>below vnew<cr>", { desc = "Open Split Window" })
map("n", "<leader>vl", "<cmd>above vnew<cr>", { desc = "Open Split Window" })
map("n", "<leader>hh", "<cmd>above new<cr>", { desc = "Open Horizontal" })
map("n", "<leader>hb", "<cmd>below new<cr>", { desc = "Open Horizontal" })

map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle Vertical Terminal" })
map({ "n" }, "<c-\\>", "<CMD>ToggleTerm" .. vim.v.count1 .. "<CR>", { silent = true })
map({ "i" }, "<c-\\>", "<ESC><CMD>" .. vim.v.count1 .. "ToggleTerm<cr>", { silent = true })

vim.api.nvim_create_autocmd("TermEnter", {
	pattern = "term://*toggleterm#*",
	callback = function()
		map("t", "<c-\\>", "<cmd>" .. vim.v.count1 .. "ToggleTerm<cr>", { silent = true })
	end,
})
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	map("t", "<C-]>", [[<C-\><C-n>]], opts)
	map("t", "jk", [[<C-\><C-n>]], opts)
	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
-- map({ "n", "i" }, "<c-\\>", )

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
-- map({ "i", "t" }, "<C-[>", "<Esc>", { desc = "Escape vim", silent = true, noremap = true })
map({ "i", "t" }, "jj", "<Esc>", { desc = "Escape vim", silent = true, noremap = true })
-- map("n", "<C-[>", "i", { desc = "Enter Insert Mode" })
map("n", "<leader>1", "1gt", { desc = "Go to first tab" })
map("n", "<leader>2", "2gt", { desc = "Go to first tab" })
map("n", "<leader>3", "3gt", { desc = "Go to first tab" })
map("n", "<leader>4", "4gt", { desc = "Go to first tab" })
map("n", "<leader>5", "5gt", { desc = "Go to first tab" })
map("n", "<leader>6", "6gt", { desc = "Go to first tab" })
map("n", "<leader>7", "7gt", { desc = "Go to first tab" })
map("n", "<leader>8", "8gt", { desc = "Go to first tab" })
map("n", "<leader>9", "9gt", { desc = "Go to first tab" })
map("n", "<leader>tn", "<cmd>tabe<cr>", { desc = "Open new tab" })
map("n", "<leader>tc", "<cmd>tabc<cr>", { desc = "Close tab" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "File grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffer" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })
map("n", "<leader>fo", '<cmd>lua require"telescope.builtin".oldfiles()<cr>', { desc = "Find Old files" })
map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "File grep in current buffer" })
map("n", "<leader>sk", '<cmd>lua require"telescope.builtin".keymaps()<cr>', { desc = "Search Keymaps" })
map("n", "<leader>ts", "<cmd>Telescope<cr>", { desc = "Open Telescope" })
map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Git Files" })
map("n", "<leader>bf", "<cmd>Telescope file_browser use_fd=false<cr>", { desc = "File Browser", noremap = true })
map("n", "<leader>ft", "<cmd>lua require'telescope.builtin'.treesitter()<cr>", { desc = "Treesitter" })
