return {
    {
        "stevearc/oil.nvim",
        enabled = true,
        lazy = true,
        cmd = "Oil",
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function(_, opts)
            local oil = require("oil")
            oil.setup(opts)
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },
}
