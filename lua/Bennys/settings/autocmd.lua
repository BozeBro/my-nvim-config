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

local regCreate = require("util").createPrefixUserCMD
regCreate("Help", function(args)
    -- vim.opt.buflisted = true
    -- vim.bo[event.buf].buflisted = true
    vim.cmd.help(args.args)
    vim.cmd.only()
end, { nargs = 1, complete = "help" })
