return {
    { "MunifTanjim/nui.nvim" },

    {
        "folke/noice.nvim",
        lazy = false,
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            cmdline = {
                view = "cmdline_popup",
                format = {
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    bash = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = {
                        pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
                        --[[ icon = "", ]]
                        icon = "lua",
                        lang = "lua",
                        -- conceal = false,
                    },
                    help = {
                        pattern = "^:%s*he?l?p?%s+", --[[ icon = "" ]]
                        icon = "help",
                    },
                    BigHelp = {
                        pattern = "^:%s*He?l?p?%s+", --[[ icon = "" ]]
                        icon = "Help",
                    },
                },
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                signature = {
                    auto_open = {
                        enabled = false,
                    },
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = false,      -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- add a border to hover docs and signature help
            },
        },
        config = function(_, opts)
            local noice = require("noice")
            noice.setup(opts)
        end,
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
            timeout = 1000,
            stages = "static",
        },
    },
}
