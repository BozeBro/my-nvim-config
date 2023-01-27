return {
    {
        "phaazon/hop.nvim",
        version = "v2",
        opts = {
            keys = "etovxqpdygfblzhckisuran",
        },
        config = function(_, opts)
            local hop = require("hop")
            hop.setup(opts)
            local map = vim.keymap.set
            local directions = require("hop.hint").HintDirection
            map("", "f", function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end, { remap = true })
            map("", "F", function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end, { remap = true })
            map("", "t", function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end, { remap = true })
            map("", "T", function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
            end, { remap = true, desc = "Hop to before char, on current line, " })
            map({ "n", "v" }, "<leader>ha", "<cmd>HopAnywhere<cr>", { desc = "Hop Anywhere" })
            map({ "n", "v" }, "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop Word" })
            map({ "n", "v" }, "<leader>hp", "<cmd>HopPattern<cr>", { desc = "Hop Pattern" })
        end,
    },
}
