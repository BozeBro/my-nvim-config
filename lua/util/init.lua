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
return M
