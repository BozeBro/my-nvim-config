---@diagnostic disable: deprecated
-- Will probably delete lualine sometime in the future. I don't really need it besides recording
return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "folke/noice.nvim" },
        config = function()
            -- local wpm = require("wpm")
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    -- globalstatus = true, -- to have just one lualine, the inactive_* won't work
                    component_separators = "|",
                    section_separators = "",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        {
                            "g:syncing",
                            cond = function()
                                local path = vim.fn.getcwd() .. "/.nvim/rsync.json"
                                local file = io.open(path, "r")
                                return file ~= nil
                            end,
                        },
                        -- "filename",
                    },
                    lualine_c = {
                        "branch",
                        {
                            "filename",
                            path = 1,
                        },
                        -- "filetype",
                        {
                            ---@diagnostic disable-next-line: undefined-field
                            require("noice").api.statusline.mode.get,
                            ---@diagnostic disable-next-line: undefined-field
                            cond = require("noice").api.statusline.mode.has,
                            color = { fg = "#ff9e64" },
                        },
                    },
                    -- lualine_x = { wpm.wpm },
                    lualine_x = {
                        {
                            "mode",
                            fmt = function(out, ctx)
                                local row, col = unpack(vim.api.nvim_win_get_cursor(0))

                                if out == "VISUAL" then
                                    local start_point = vim.fn.getpos("v")
                                    local start_col = start_point[3] - 1
                                    return vim.fn.string(math.abs(col - start_col))
                                else
                                    return vim.fn.string(col)
                                end
                            end,
                        },
                    },
                    lualine_y = {},
                    lualine_z = {},
                },
            }
        end,
        event = "VeryLazy",
    },
}
