-- Keymaps for better default experience
-- See `:help vim.keymap.set`

-- map({ "n", "i" }, "<c-\\>", )
-- vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
--     if not require("noice.lsp").scroll(4) then
--         return "<c-f>"
--     end
-- end, { silent = true, expr = true })
--
-- vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
--     if not require("noice.lsp").scroll( -4) then
--         return "<c-b>"
--     end
-- end, { silent = true, expr = true })

return {
	{ { "n", "v" }, "<Space>", "<Nop>", { silent = true, desc = "Make <Leader> behave as expected" } },
	{ "n", "<S-Tab>", "<Nop>", { silent = true } },
	{
		"n",
		"k",
		"v:count == 0 ? 'gk' : 'k'",
		{ expr = true, silent = true, desc = "remap for dealing with word wrap" },
	},
	{
		"i",
		"<C-l>",
		"<Tab>",
		{ silent = true, noremap = true },
	},
	{
		"n",
		"j",
		"v:count == 0 ? 'gj' : 'j'",
		{ expr = true, silent = true },
	},
	{ { "n", "v" }, "<leader>q", "<cmd>q<cr>", { desc = "Quit Vim" } },
	{ { "n", "v" }, "<leader>w", "<cmd>w<cr>", { desc = "Save Vim" } },
	{
		{ "n", "v" },
		"<leader>zq",
		"<cmd>q!<cr>",
		{ desc = "Quit w/e saving" },
	},
	{
		{ "n" },
		"<leader>x",
		"<cmd>wq<cr>",
		{ desc = "Quit and Save" },
	},

	-- Resize the screen,
	{
		{ "n", "v" },
		"<C-c>",
		"<cmd>vertical resize +5<cr>",
		{ desc = "Increase screen size" },
	},
	{
		{ "n", "v" },
		"<C-x>",
		"<cmd>vertical resize -5<cr>",
		{ desc = "Decrease screen size" },
	},
	{
		"n",
		"<leader>e",
		"<cmd>Telescope file_browser<cr>",
		{ desc = "Open File Explorer" },
	},
	{
		"n",
		"<leader>vv",
		"<cmd>below vnew<cr>",
		{ desc = "Open Split Window" },
	},
	{
		"n",
		"<leader>vl",
		"<cmd>above vnew<cr>",
		{ desc = "Open Split Window" },
	},
	{
		"n",
		"<leader>hh",
		"<cmd>above new<cr>",
		{ desc = "Open Horizontal" },
	},
	{
		"n",
		"<leader>hb",
		"<cmd>below new<cr>",
		{ desc = "Open Horizontal" },
	},
	{
		"n",
		"<leader>th",
		"<cmd>ToggleTerm direction=horizontal<cr>",
		{ desc = "Toggle Horizontal Terminal" },
	},
	{
		"n",
		"<leader>tv",
		"<cmd>ToggleTerm direction=vertical<cr>",
		{ desc = "Toggle Vertical Terminal" },
	},

	{
		{ "i" },
		"<c-\\>",
		"<ESC><CMD>" .. vim.v.count1 .. "ToggleTerm<cr>",
		{ silent = true, desc = "Toggle nth Terminal" },
	},
	-- {
	--     "i",
	--     "<Tab>",
	--     "<cmd>lua EscapePair()<CR>",
	--     { noremap = true, silent = true, desc = "Escape Pair" },
	-- },
	{
		"n",
		"<leader>bn",
		"<cmd>bnext<cr>",
		{ desc = "Go to next Buffer" },
	},
	{
		"n",
		"<leader>bb",
		"<cmd>bprev<cr>",
		{ desc = "Go to previous Buffer" },
	},
	{
		"n",
		"<leader>bd",
		"<cmd>bd<cr>",
		{ desc = "Close current buffer" },
	},
	-- map({ "i", "t" }, "<C-[>", "<Esc>", { desc = "Escape vim", silent = true, noremap = true }),
	{
		{ "i", "v" },
		"jk",
		"<Esc>",
		{ desc = "Escape vim", silent = true, noremap = true },
	},
	{
		"n",
		"jk",
		"i",
		{ desc = "Enter Insert Mode", noremap = true },
	},
	-- map("n", "<C-[>", "i", { desc = "Enter Insert Mode" })
	{
		"n",
		"<leader>1",
		"<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>",
		{ desc = "Go to first tab" },
	},
	{
		"n",
		"<leader>2",
		"<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>",
		{ desc = "Go to second tab" },
	},
	{
		"n",
		"<leader>3",
		"<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>",
		{ desc = "Go to third tab" },
	},
	{
		"n",
		"<leader>4",
		"<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>",
		{ desc = "Go to fourth tab" },
	},
	{
		"n",
		"<leader>5",
		"<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>",
		{ desc = "Go to fifth tab" },
	},
	{
		"n",
		"<leader>6",
		"<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>",
		{ desc = "Go to sixth tab" },
	},
	{
		"n",
		"<leader>7",
		"<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>",
		{ desc = "Go to seventh tab" },
	},
	{
		"n",
		"<leader>8",
		"<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>",
		{ desc = "Go to eighth tab" },
	},
	{
		"n",
		"<leader>9",
		"<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>",
		{ desc = "Go to ninth tab" },
	},
	{
		"n",
		"<leader>tn",
		"<cmd>tabe<cr>",
		{ desc = "Open new tab" },
	},
	{ "n", "<leader>tc", "<cmd>tabc<cr>", { desc = "Close tab" } },
	{ "n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" } },
	{ "n", "<leader>fn", "<cmd>Telescope noice<cr>", { desc = "Open messages" } },
	{ "n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "File grep" } },
	{
		"n",
		"<leader>fb",
		"<cmd>Telescope buffers<cr>",
		{ desc = "Find buffer" },
	},
	{ "n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" } },
	{
		"n",
		"<leader>fo",
		'<cmd>lua require"telescope.builtin".oldfiles()<cr>',
		{ desc = "Find Old files" },
	},
	{
		"n",
		"<leader>/",
		"<cmd>Telescope current_buffer_fuzzy_find<cr>",
		{ desc = "File grep in current buffer" },
	},
	{
		"n",
		"<leader>sk",
		'<cmd>lua require"telescope.builtin".keymaps()<cr>',
		{ desc = "Search Keymaps" },
	},
	{
		"n",
		"<leader>ts",
		"<cmd>Telescope<cr>",
		{ desc = "Open Telescope" },
	},

	{ "n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Git Files" } },
	{
		"n",
		"<leader>bf",
		"<cmd>Telescope file_browser use_fd=false<cr>",
		{ desc = "File Browser", noremap = true },
	},
	{
		"n",
		"<leader>ft",
		"<cmd>lua require'telescope.builtin'.treesitter()<cr>",
		{ desc = "Treesitter" },
	},
	{ "n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" } },
}
