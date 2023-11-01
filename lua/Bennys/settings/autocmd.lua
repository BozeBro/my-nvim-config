local map = vim.keymap.set
local function augroup(name)
	return vim.api.nvim_create_augroup("Bennys " .. name, { clear = true })
end
vim.api.nvim_create_autocmd("TermEnter", {
	pattern = "term://*toggleterm#*",
	callback = function()
		map("t", "<c-\\>", "<cmd>" .. vim.v.count1 .. "ToggleTerm<cr>", { silent = true })
	end,
})
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	map("t", "<C-]>", [[<C-\><C-n>]], opts)
	map("t", "jj", [[<C-\><C-n>]], opts)

	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- api.nvim_create_autocmd("FileType", { pattern = "netrw", command = "Telescope file_browser" })
-- api.nvim_create_autocmd("BufWritePre", { command = "lua vim.lsp.buf.format()" })
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
-- vim.cmd(
-- [[au FileType * lua << EOF | local parser = vim.treesitter.get_parser(0)  | if parser ~= nil then parser:register_cbs({on_bytes = function () parser:parse() end }) end | EOF ]])
