local M = {}
local map = vim.keymap.set
M.syncDefault = function()
	return "Rsync"
end
M.dir = "./.nvim"
M.fileLoc = ".nvim/rsync.json"
M.keymaps = {}
function M.empty(table)
	return table == nil or next(table) == nil
end

M.mapKeys = function(keys)
	for _, key in pairs(keys) do
		-- print(unpack(key))
		map(unpack(key))
	end
end
M.concatTable = function(src, dst)
	for _, v in pairs(src) do
		table.insert(dst, v)
	end
	return dst
end
M.getHighlightRange = function()
	local start_line = vim.fn.line("'<")
	local start_col = vim.fn.col("'<")
	local end_line = vim.fn.line("'>")
	local end_col = vim.fn.col("'>")

	return {
		start = { line = start_line, col = start_col },
		finish = { line = end_line, col = end_col },
	}
end
return M
