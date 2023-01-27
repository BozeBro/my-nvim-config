return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
        },
        config = function(_, opts)
            require("tokyonight").load(opts)
        end,
    },
    { "ellisonleao/gruvbox.nvim", lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true, config = true },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "windwp/nvim-autopairs", opts = {}, config = true },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPost",
        opts = {
            char = "|",
            show_trailing_blankline_indent = false,
        },
    },
}
