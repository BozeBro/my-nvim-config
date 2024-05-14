return {
    {
        "mbbill/undotree",
        keys = { "<leader><F5>" },
        config = function()
            vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "[undo] Undo File Tree" })
        end,
    },
}
