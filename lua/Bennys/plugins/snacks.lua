return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        statuscolumn = { enabled = false },
        dashboard = { example = "github" },
        words = { enabled = false },
    },
    {
        "folke/edgy.nvim",
        ---@module 'edgy'
        ---@param opts Edgy.Config
        opts = function(_, opts)
            for _, pos in ipairs { "top", "bottom", "left", "right" } do
                opts[pos] = opts[pos] or {}
                table.insert(opts[pos], {
                    ft = "snacks_terminal",
                    size = { height = 0.4 },
                    title = "%{b:snacks_terminal.id}: %{b:term_title}",
                    filter = function(_buf, win)
                        return vim.w[win].snacks_win
                            and vim.w[win].snacks_win.position == pos
                            and vim.w[win].snacks_win.relative == "editor"
                            and not vim.w[win].trouble_preview
                    end,
                })
            end
        end,
    },
}
