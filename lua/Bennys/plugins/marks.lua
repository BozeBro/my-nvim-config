-- recommended lazy load
local harpoon = {
    {
        "ThePrimeagen/harpoon",
        event = "BufReadPre",
        keys = { "<leader>np", "<leader>nn", "<leader>jj", "<leader>tq", "<leader>m" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            local ui = require("harpoon.ui")
            local map = vim.keymap.set
            harpoon.setup()
            map("n", "<leader>m", require("harpoon.mark").add_file, { desc = "[HARPOON] Add mark" })
            map("n", "<leader>tq", ui.toggle_quick_menu, { desc = "[HARPOON] View marks" })

            map("n", "<leader>nn", ui.nav_next, { desc = "[HARPOON] navigate next" })
            map("n", "<leader>np", ui.nav_prev, { desc = "[HARPOON] navigate previous" })
            for serial = 1, 9 do
                local key = tostring(serial)
                map("n", "<leader>" .. key, function()
                    ui.nav_file(serial)
                end, { desc = "[HARPOON] navigate to file " .. key })
            end
        end,
    },
}
return harpoon
