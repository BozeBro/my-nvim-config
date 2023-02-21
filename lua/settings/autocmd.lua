local map = require("util").map
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

-- api.nvim_create_autocmd("FileType", { pattern = "netrw", command = "Telescope file_browser" })
