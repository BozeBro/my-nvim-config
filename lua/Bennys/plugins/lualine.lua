---@diagnostic disable: deprecated
-- TODO replace deprecated statusline
return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "folke/noice.nvim" },
        config = function()
            require("lualine").setup({
                sections = {
                    lualine_c = {
                        "filename",
                        "filetype",
                        {
                            require("noice").api.status.mode.get,
                            cond = require("noice").api.status.mode.has,
                            color = { fg = "#ff9e64" },
                        },
                    },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
            })
        end,
        event = "BufReadPre",
    },
}
