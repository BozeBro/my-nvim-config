return {
    -- Open and close brackets while keeping consistent indents on coding style
    {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "BufReadPre",
        config = true,
        -- config = function(_, opts)
        --     local surround = require("nvim-surround")
        --     surround.setup(opts)
        --     local continue_surround = function()
        --         local utils = require("nvim-surround.utils")
        --     end
        -- end,
    },
}
