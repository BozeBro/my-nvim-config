return {
    {
        "folke/tokyonight.nvim",
        enabled = true,
        -- lazy = false,
        -- priority = 1000,

        -- lazy = false,
        -- priority = 1000,
        opts = {
            style = "storm",
            dim_inactive = true,
        },
        config = function(_, opts)
            require("tokyonight").load(opts)
            local fg = "#a1afcb"
            vim.api.nvim_set_hl(0, "LineNrAbove", { fg = fg })
            vim.api.nvim_set_hl(0, "LineNrBelow", { fg = fg })
        end,
    },
    { "ellisonleao/gruvbox.nvim", lazy = true },
    {
        "https://github.com/catppuccin/nvim",
        enabled = false,
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            flavour = "mocha",
            -- flavour = "latte",
            -- transparent_background = true,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
    {
        "https://github.com/EdenEast/nightfox.nvim",
        -- lazy = false,
        -- priority = 1000,
        lazy = true,
        enabled = false,
        config = function()
            vim.cmd([[colorscheme nordfox]])
        end,
    },
    {
        "AlexvZyl/nordic.nvim",
        lazy = true,
        config = function()
            require("nordic").load()
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        -- lazy = true,
        lazy = true,
        priority = 1000,
        config = function(_, opts)
            require("kanagawa").load("wave")
            require("kanagawa").setup(opts)
        end,
    },
}
