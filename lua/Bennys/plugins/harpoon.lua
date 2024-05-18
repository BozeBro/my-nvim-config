-- recommended lazy load

local H = {
    {
        "ThePrimeagen/harpoon",
        event = "BufReadPre",
        keys = { "<leader>np", "<leader>nn", "<leader>jj", "<leader>tq", "<leader>m" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            local ui = require("harpoon.ui")
            local mark = require("harpoon.mark")
            local map = vim.keymap.set
            harpoon.setup()
            map("n", "<leader>m", function()
                mark.add_file()
                vim.cmd(":do User")
            end, { desc = "[HARPOON] Add mark" })
            map("n", "<leader>tq", ui.toggle_quick_menu, { desc = "[HARPOON] View marks" })

            map("n", "<leader>nn", ui.nav_next, { desc = "[HARPOON] navigate next" })
            map("n", "<leader>np", ui.nav_prev, { desc = "[HARPOON] navigate previous" })
            for serial = 1, 9 do
                local key = tostring(serial)
                map("n", "<leader>" .. key, function()
                    ui.nav_file(serial)
                end, { desc = "[HARPOON] navigate to file " .. key })
                vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
                vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
                vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
                vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
                vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
            end
            function Harpoon_files()
                local contents = {}
                local marks_length = mark.get_length()
                vim.opt.showtabline = marks_length >= 1 and 2 or 1
                local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
                for index = 1, marks_length do
                    local harpoon_file_path = mark.get_marked_file_name(index)

                    --[===[
                    Below line is equivalent to
                    if harpoon_file_path == "" then
                        file_name = "(empty)"
                    else
                        file_name = vim.fn.fnamemodify(harpoon_file_path, ":t")
                        ]===]
                    --
                    local file_name = harpoon_file_path == "" and "(empty)"
                        or vim.fn.fnamemodify(harpoon_file_path, ":t")

                    if current_file_path == harpoon_file_path then
                        contents[index] =
                            string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, file_name)
                    else
                        contents[index] =
                            string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index, file_name)
                    end
                end

                return table.concat(contents)
            end

            vim.opt.showtabline = 1
            vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "User" }, {
                callback = function(ev)
                    vim.o.tabline = Harpoon_files()
                end,
            })
        end,
    },
}
return H
