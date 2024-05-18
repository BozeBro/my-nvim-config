local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

local newOpt = {
    dev = {
        path = "~/.config/plugins",
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
            ---@type string[]
            paths = {}, -- add any custom paths here that you want to includes in the rtp
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                -- "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                -- "tarPlugin",
                -- "tohtml",
                -- "tutor",
                -- "zipPlugin",
            },
        },
    },
}
local lazy = require("lazy")
local plugins = {

    "treesitter",
    "lualine",
    "fileexplore",
    "lsp",
    "init",
    "autopairs",
    "cmp",
    "colorscheme",
    "comments",
    "dap",
    --
    "fast",
    "flatten",
    "git",
    --
    "hop",
    "luasnip",
    "marks",
    "mini",
    "neogit",
    "noice",
    "null",
    "obsidian",
    "session",
    "ssh",
    "telescope",
    "todo",
    "undo",
}

-- local lset = function()
--     local lua_plugins = {}
--     for _, value in ipairs(plugins) do
--         table.insert(lua_plugins, require("Bennys.plugins." .. value))
--     end
--
--     lazy.setup(lua_plugins, newOpt)
-- end
-- lset()
lazy.setup("Bennys.plugins", newOpt)
-- lazy.setup()

-- require("Bennys.lazy")
