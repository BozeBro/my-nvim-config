return {
    -- {
    --     "phaazon/hop.nvim",
    --     event = "VeryLazy",
    --     lazy = true,
    --     version = "v2",
    --     opts = {
    --         keys = "etovxqpdygfblzhckisuran",
    --     },
    --     config = function(_, opts)
    --         local hop = require("hop")
    --         hop.setup(opts)
    --         local map = vim.keymap.set
    --         map("n", "<leader>f", "<cmd>HopChar1<cr>", { desc = "Hop Char" })
    --         map({ "n", "v" }, "<leader>ha", "<cmd>HopAnywhere<cr>", { desc = "Hop Anywhere" })
    --         map({ "n", "v" }, "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop Word" })
    --         map({ "n", "v" }, "<leader>hp", "<cmd>HopPattern<cr>", { desc = "Hop Pattern" })
    --     end,
    -- },
    {
        "ggandor/leap.nvim",
        -- event = "BufEnter",
        lazy = true,
        keys = { "f", "F" },
        config = function()
            -- local u = require("util")
            -- u.mapKeys({ { "n", "S", "<Nop>", {} } })
            local map = vim.keymap.set
            map("n", "f", "<Plug>(leap-forward-to)")
            map("n", "F", "<Plug>(leap-backward-to)")
        end,
    },
}
