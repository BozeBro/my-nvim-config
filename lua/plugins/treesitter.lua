return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        opts = {
            ensure_installed = { "c", "vim", "help", "lua", "cpp", "go", "python", "javascript", "typescript" },
            sync_install = false,
            highlight = { enable = true },
        },
        ---@diagnostic disable-next-line: unused-local
        config = function(plugin, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
