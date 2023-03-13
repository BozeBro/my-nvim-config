local M = {}
local map = vim.keymap.set
M.keymaps = {}
M.mapKeys = function(keys)
	for _, key in pairs(keys) do
		-- print(unpack(key))
		map(unpack(key))
	end
end
M.concatTable = function (src, dst)
	for _, v in pairs(src) do
		table.insert(dst, v)
	end
	return dst
end
return M
