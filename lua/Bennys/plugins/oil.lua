return {
    {
        "stevearc/oil.nvim",
        enabled = true,
        lazy = false,
        version = "*",
        cmd = "Oil",
        keys = { "-" },
        opts = {
            default_file_explorer = true,
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function(_, opts)
            local oil = require("oil")
            oil.setup(opts)
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },
}
