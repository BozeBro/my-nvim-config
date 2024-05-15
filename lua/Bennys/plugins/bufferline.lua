local function get_marked_buffers()
    local mark = require("harpoon.mark")
    local harpoon_file_names = {}
    local current_idx = 1

    while mark.get_marked_file_name(current_idx) do
        local file_name = mark.get_marked_file_name(current_idx)

        harpoon_file_names[file_name] = current_idx
        current_idx = current_idx + 1
    end

    return harpoon_file_names
end
return {
    {
        "akinsho/bufferline.nvim",
        -- enabled = false,
        event = "BufReadPre",
        version = "*",
        dependencies = { "ThePrimeagen/harpoon", "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                numbers = function(buffer)
                    -- get the harpoon buffers and the name of the buffer
                    local buf_name = vim.fn.bufname(buffer.id)
                    local harpoon_names = get_marked_buffers()

                    return harpoon_names[buf_name] or ""
                end,
                custom_filter = function(buf_number)
                    -- get the harpoon buffers and the name of the buffer
                    local harpoon_names = get_marked_buffers()
                    local buf_name = vim.fn.bufname(buf_number)
                    return harpoon_names[buf_name] ~= nil

                    -- local idx = get_index_of_value(harpoon_buffers, buf_name)
                    --
                    -- if idx then
                    --     return true
                    -- end
                    -- return false
                end,
                sort_by = function(buffer_a, buffer_b)
                    -- get the harpoon buffers and the names of the buffers
                    local harpoon_names = get_marked_buffers()
                    local buf_name_a = vim.fn.bufname(buffer_a.id)
                    local buf_name_b = vim.fn.bufname(buffer_b.id)

                    local idx_a = harpoon_names[buf_name_a]
                    local idx_b = harpoon_names[buf_name_b]

                    return idx_a < idx_b
                end,
            },

            -- options = { mode = "tabs" }
        },
    },
    { "tiagovla/scope.nvim", config = true },
}
