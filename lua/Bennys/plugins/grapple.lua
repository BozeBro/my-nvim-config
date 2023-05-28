return {
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon.setup()
            vim.keymap.set("n", "<leader>m", require("harpoon.mark").add_file, { desc = "Add mark" })
            vim.keymap.set("n", "<leader>tq", require("harpoon.ui").toggle_quick_menu, { desc = "View marks" })
        end,
    },
}
