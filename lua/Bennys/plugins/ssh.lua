return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = true,
        keys = { { "<leader>nt", "<cmd>Neotree toggle position=current<cr>", mode = "n" } },
        -- branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        opts = {
            window = {
                mappings = {
                    ["<c-[>"] = "cancel",
                },
            },
            sources = {
                "filesystem", -- Neotree filesystem source
            },
            filesystem = {
                filtered_items = {
                    always_show = {
                        ".nvim",
                    },
                },
            },
        },
        config = function(_, opts)
            local nt = require("neo-tree")
            nt.setup(opts)
            vim.api.nvim_create_augroup("neotree", {})
            -- vim.api.nvim_create_autocmd("VimEnter", {
            -- 	desc = "Open Neotree automatically",
            -- 	group = "neotree",
            -- 	callback = function()
            -- 		if vim.fn.argc() == 0 and not vim.fn.exists("s:std_in") then
            -- 			vim.cmd("Neotree toggle")
            -- 		end
            -- 	end,
            -- })
        end,
    },
    {
        "kevinhwang91/nvim-bqf",
        enabled = true,
        -- config = true,

        -- config = true,
    },
}
