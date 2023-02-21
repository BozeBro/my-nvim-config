local M = {}
M.map = vim.keymap.set
M.api = vim.api
M.buf = vim.lsp.buf
M.keymaps = {}
M.mapKeys = function(keys)
	for _, key in pairs(keys) do
		-- print(unpack(key))
		M.map(unpack(key))
	end
end
return M
