local util = require("util")

--- Check if a file or directory exists in this path
local function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

--- Check if a directory exists in this path
local function isdir(path)
    -- "/" works on both Unix and Windows
    return exists(path .. "/")
end

local M = {}
function M.load_launchjs()
    local path = vim.fn.getcwd() .. "/" .. util.fileLoc
    local file = io.open(path, "r")
    if not file then
        return {}
    end
    local content = file:read("*a")
    file:close()
    local myTable = vim.json.decode(content)

    return myTable
end

function M.write_blank(file)
    if not isdir(util.dir) then
        local ok = os.execute("mkdir " .. util.dir)
        if ok ~= 0 then
            print("Error code " .. ok .. "\n")
            return
        end
    end
    local path = io.open(file, "w+")
    -- host, hostPath, path
    local tab = {
        host = "host",
        hostPath = "remotePath",
        path = "path",
    }
    ---@diagnostic disable-next-line: need-check-nil
    path:write(vim.fn.json_encode(tab))
    io.close(path)
end

function M.getText()
    return vim.g.syncing
end

local function on_exit(job_id, exit_code, event)
    vim.g.syncing = util.syncDefault()
    if exit_code == 0 then
        -- print("Finished Syncing")
        return
    end
    local noice = require("noice")
    local msg = string.format("job id: %d bad code: %d\nevent: %s", job_id, exit_code, event)
    noice.notify(msg, vim.log.levels.ERROR, {})
end
function M.syncUp()
    local table = M.load_launchjs()
    if util.empty(table) then
        return
    end
    vim.g.syncing = "Syncing"
    ---@diagnostic disable-next-line: need-check-nil
    local cmd = "rsync -a " .. vim.fn.getcwd() .. " " .. table["host"] .. ":" .. table["remotePath"]
    local err = vim.fn.jobstart(cmd, {
        on_exit = on_exit,
        on_stderr = function()
            print("trying to sync command")
            print(cmd)
            print("An error has occured")
        end,
    })
    if err <= 0 then
        print("There was an error in syncing")
    end
end

function M.syncDown()
    local table = M.load_launchjs()
    if util.empty(table) then
        return
    end
    print("Start Syncing from Remote")
    vim.g.syncing = "Syncing"
    local cmd = "rsync -a " .. table["host"] .. ":" .. table["remotePath"] .. " " .. vim.fn.getcwd()
    vim.fn.jobstart(cmd, { on_exit = on_exit })
end

-- host -> Remote host
-- hostPath -> Path of the remote, either absolute or relative path
-- path -> Local path

vim.api.nvim_create_user_command("RsyncUp", M.syncUp, {})
vim.api.nvim_create_user_command("RsyncBlank", function()
    M.write_blank(util.fileLoc)
end, {})
vim.api.nvim_create_user_command("RsyncDown", M.syncDown, {})
vim.api.nvim_create_user_command("RsyncDown", M.syncDown, {})
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = M.syncUp,
})
