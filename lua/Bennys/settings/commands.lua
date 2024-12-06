-- Copy path to clipboard
local autocmd = vim.api.nvim_create_autocmd
vim.api.nvim_create_user_command("Pwd", function()
    local path = vim.fn.getcwd()
    print("Path is", path)
    -- set the + register (yank register)
    vim.fn.setreg("+", path)
end, {})

local autocmd_group = vim.api.nvim_create_augroup("Bennys.User", {
    clear = true,
})
-- regular line numbers in the cmdline
autocmd({ "CmdlineEnter" }, {
    group = autocmd_group,
    callback = function()
        -- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#a1afcb" })
        -- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#a1afcb" })
        vim.opt.relativenumber = false
        vim.cmd.redraw()
    end,
})
autocmd({ "CmdlineLeave" }, {
    group = autocmd_group,
    callback = function()
        local below_group = vim.api.nvim_get_hl(0, { name = "LineNrBelow" })
        local above_group = vim.api.nvim_get_hl(0, { name = "LineNrAbove" })
        print(vim.inspect(below_group))

        vim.opt.relativenumber = true
        vim.cmd.redraw()
    end,
})
