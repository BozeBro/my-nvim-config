return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = true,
        keys = {
            {
                "<leader>qs",
                function()
                    require("persistence").load()
                end,
                desc = "restore directory session",
            },
            {
                "<leader>ql",
                function()
                    require("persistence").load({ last = true })
                end,
                desc = "restore directory session",
            },
            {
                "<leader>qd",
                function()
                    require("persistence").stop()
                end,
                desc = "Stop persistence",
            },
        },
    },
}
