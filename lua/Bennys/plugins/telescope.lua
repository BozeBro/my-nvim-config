local map = vim.keymap.set

return {
    { "nvim-lua/plenary.nvim", lazy = true },
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        lazy = true,
        -- lazy = true,
        cmd = "Telescope",
        dependencies = {
            { "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = "make", name = "fzf" },
            { "nvim-telescope/telescope-file-browser.nvim", name = "file_browser" },
            { "nvim-lua/plenary.nvim" },
            -- { "folke/noice.nvim" },
        },
        opts = {
            defaults = {
                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                },
                mappings = {
                    n = {
                        -- ["jj"] = require("telescope.actions").delete_buffer,
                    },
                },
            },
            extensions = {
                file_browser = {
                    theme = "dropdown",
                    -- hijack_netrw = true,
                    depth = false,
                    -- use_fd = true,
                },
                path = "%:p:h",
            },
        },
        init = function()
            map("n", "<leader>cd", "<cmd>Telescope zoxide list<cr>", { desc = "Cd into directory" })

            map("n", "<leader>rl", "<cmd>Telescope repo list<cr>", { desc = "open repositories" })
            map("n", "<leader>n", "<cmd>Telescope noice<cr>", { desc = "Open messages" })
            -- code
        end,
        config = function(_, opts)
            local tele = require("telescope")

            ---@diagnostic disable-next-line: missing-parameter
            tele.setup(opts)
            tele.load_extension("fzf")
            tele.load_extension("file_browser")
            tele.load_extension("notify")
            tele.load_extension("noice")
            tele.load_extension("harpoon")
            tele.load_extension("zoxide")
            tele.load_extension("repo")
            -- Playtest for now
            -- Change direct when opening a new project
            local g = vim.g
            g["rooter_cd_cmd"] = "lcd"
        end,
    },
    { "cljoly/telescope-repo.nvim", lazy = true, dependencies = { "vim-rooter" } },
    { "jvgrootveld/telescope-zoxide", lazy = true },
    { "airblade/vim-rooter", lazy = true },
}
