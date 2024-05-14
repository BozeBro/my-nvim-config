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
vim.api.nvim_create_autocmd({ "TabEnter", "UIEnter" }, {
    -- pattern = "LazyVimStarted",
    once = true,
    callback = function()
        -- this needs to be deffered for some other stuff to load, I am not sure there is a better event
        vim.defer_fn(function()
            local mark = require("harpoon.mark")
            local harpoon_buffers = {}
            local current_idx = 1

            while mark.get_marked_file_name(current_idx) do
                harpoon_buffers[current_idx] = mark.get_marked_file_name(current_idx)
                current_idx = current_idx + 1
            end

            -- for each of the harpoon buffers we open them
            for _, buffer in ipairs(harpoon_buffers) do
                vim.cmd("badd " .. buffer)
            end

            require("harpoon.ui").nav_file(1)
        end, 10)
    end,
})
