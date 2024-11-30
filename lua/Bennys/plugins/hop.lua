local function original_jump()
    require("flash").jump {}
end
local function diag_jump()
    require("flash").jump {
        matcher = function(win)
            ---@param diag Diagnostic
            return vim.tbl_map(function(diag)
                return {
                    pos = { diag.lnum + 1, diag.col },
                    end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
                }
            end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
        end,
        action = function(match, state)
            vim.api.nvim_win_call(match.win, function()
                vim.api.nvim_win_set_cursor(match.win, match.pos)
                vim.diagnostic.open_float()
            end)
            state:restore()
        end,
    }
end

return {
    {
        "phaazon/hop.nvim",
        event = "VeryLazy",
        lazy = true,
        enabled = false,
        version = "v2",
        opts = {
            keys = "etovxqpdygfblzhckisuran",
        },
        config = function(_, opts)
            local hop = require("hop")
            hop.setup(opts)
            local map = vim.keymap.set
            map("n", "<leader>f", "<cmd>HopChar1<cr>", { desc = "Hop Char" })
            map({ "n", "v" }, "<leader>ha", "<cmd>HopAnywhere<cr>", { desc = "Hop Anywhere" })
            map({ "n", "v" }, "<leader>hw", "<cmd>HopWord<cr>", { desc = "Hop Word" })
            map({ "n", "v" }, "<leader>hp", "<cmd>HopPattern<cr>", { desc = "Hop Pattern" })
        end,
    },
    {
        "ggandor/leap.nvim",
        -- event = "BufEnter",
        enabled = false,
        lazy = true,
        keys = { "f", "F" },
        config = function()
            local map = vim.keymap.set
            map("n", "f", "<Plug>(leap-forward-to)")
            map("n", "F", "<Plug>(leap-backward-to)")
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        enabled = true,
        ---@type Flash.Config
        opts = {
            modes = {
                char = {
                    jump_labels = true,
                },
            },
        },
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            -- { "s",     mode = { "n", "x", "o" }, diag_jump,                                           desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-m>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
        config = function(_, opts)
            local Flash = require("flash")
            Flash.setup(opts)
            -- More advanced example that also highlights diagnostics:

            ---@param format_opts Flash.Format
            local function format(format_opts)
                -- always show first and second label
                return {
                    { format_opts.match.label1, "FlashMatch" },
                    { format_opts.match.label2, "FlashLabel" },
                }
            end

            vim.keymap.set("n", "<leader>hw", function()
                Flash.jump {
                    search = { mode = "search" },
                    label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
                    pattern = [[\<]],
                    action = function(match, state)
                        state:hide()
                        Flash.jump {
                            search = { max_length = 0 },
                            highlight = { matches = false },
                            label = { format = format },
                            matcher = function(win)
                                -- limit matches to the current label
                                return vim.tbl_filter(function(m)
                                    return m.label == match.label and m.win == win
                                end, state.results)
                            end,
                            labeler = function(matches)
                                for _, m in ipairs(matches) do
                                    m.label = m.label2 -- use the second label
                                end
                            end,
                        }
                    end,
                    labeler = function(matches, state)
                        local labels = state:labels()
                        for m, match in ipairs(matches) do
                            match.label1 = labels[math.floor((m - 1) / #labels) + 1]
                            match.label2 = labels[(m - 1) % #labels + 1]
                            match.label = match.label1
                        end
                    end,
                }
            end)
        end,
    },
}
