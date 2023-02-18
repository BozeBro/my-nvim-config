return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = [[<c-\>]],
        },
        lazy = true,
        cmd = { "ToggleTerm", "TermExec" },
        keys = {
            { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",             { desc = "Toggle Float Terminal" } },
            {
                "<leader>th",
                "<cmd>ToggleTerm direction=horizontal<cr>",
                { desc = "Toggle Horizontal Terminal" },
            },
            { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical <cr>", { desc = "Toggle Vertical Terminal" } },
            { "<leader>tt", "<cmd>ToggleTerm direction=tab <cr>",              { desc = "Toggle Tabbed Terminal" } },

            -- { "<leader>tl", "<cmd>TermExec cmd='lazygit' dir=./ direction=float <cr>", { desc = "Toggle Lazygit" } },
        },
    },
}
