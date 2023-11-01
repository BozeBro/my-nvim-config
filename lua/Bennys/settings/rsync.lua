local util = require("util")
local M = {}
function M.load_launchjs()
	local path = vim.fn.getcwd() .. "/.nvim/rsync.json"
	local file = io.open(path, "r")
	if not file then
		return {}
	end
	local content = file:read("*a")
	file:close()
	local myTable = vim.json.decode(content)

	return myTable
end

function M.getText()
	return vim.g.syncing
end

local function on_exit(obj)
	vim.g.syncing = util.syncDefault()
	if obj.code == 0 then
		-- print("Finished Syncing")
		return
	end
	local noice = require("noice")
	local msg = string.format("bad code: %d\nerror: %s", obj.code, obj.stderr)
	noice.notify(msg, vim.log.levels.ERROR, {})
end
function M.syncUp()
	local table = M.load_launchjs()
	if util.empty(table) then
		return
	end
	vim.g.syncing = "Syncing"
	vim.system({
		"rsync",
		"-a",
		table["path"],
		table["host"] .. ":" .. table["hostPath"],
	}, nil, on_exit)
end

function M.syncDown()
	local table = M.load_launchjs()
	if util.empty(table) then
		return
	end
	print("Start Syncing from Remote")
	vim.g.syncing = "Syncing"
	vim.system({
		"rsync",
		"-a",
		table["host"] .. ":" .. table["hostPath"],
		table["path"],
	}, nil, on_exit)
end

-- host -> Remote host
-- hostPath -> Path of the remote, either absolute or relative path
-- path -> Local path

vim.api.nvim_create_user_command("RsyncUp", M.syncUp, {})
vim.api.nvim_create_user_command("RsyncDown", M.syncDown, {})
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = M.syncUp,
})
