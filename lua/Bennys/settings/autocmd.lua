local map = vim.keymap.set
local function augroup(name)
    return vim.api.nvim_create_augroup("Bennys " .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	pattern = "*",
-- 	callback = function(event)
-- 		-- print("Hi")
-- 		-- print(vim.inspect(vim.bo[event.buf]))
-- 		if vim.bo[event.buf].filetype == "help" then
-- 			vim.bo[event.buf].buflisted = true
-- 			vim.cmd.only()
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "DirChanged" }, {
    pattern = "*",
    callback = function()
        vim.cmd([[ call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd)) ]])
        -- LspRestart doesn't seem to reload the workspace
        vim.cmd("LspStop")
        vim.cmd("LspStart")
    end,
    -- group = "my_other_autocommands",
})

local regCreate = require("util").createPrefixUserCMD
regCreate("Help", function(args)
    -- vim.opt.buflisted = true
    -- vim.bo[event.buf].buflisted = true
    vim.cmd.help(args.args)
    vim.cmd.only()
end, { nargs = 1, complete = "help" })
