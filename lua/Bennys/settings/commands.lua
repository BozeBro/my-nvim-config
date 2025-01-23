-- Copy path to clipboard
vim.api.nvim_create_user_command("Pwd", function()
    local path = vim.fn.getcwd()
    print("Path is", path)
    -- set the + register (yank register)
    vim.fn.setreg("+", path)
end, {})
