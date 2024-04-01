return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    cmd = "Obsidian",
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        attachments = {
            img_folder = "~/Obsidian Vault/assets",
        },
        disable_frontmatter = false,
        preferred_link_style = "markdown",
        wiki_link_func = "use_alias_only",
        daily_notes = {
            folder = "Daily Notes/",
            date_format = "%B %d, %Y",
        },
        workspaces = {
            {
                name = "personal",
                path = "/Users/benedictozua/Obsidian Vault",
                overrides = {
                    notes_subdir = "/Users/benedictozua/Obsidian Vault/My Notes",
                },
            },
            -- {
            -- 	name = "work",
            -- 	path = "~/vaults/work",
            -- },
        },

        -- see below for full list of options 👇
    },
    config = function(_, opts)
        local obsidian = require("obsidian")
        obsidian.setup(opts)
    end,
}
