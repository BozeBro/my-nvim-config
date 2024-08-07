return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        version = "94f9a46b37f2a7ac674d518f80cf5b1d9eb8445e",

        build = ":TSUpdate",
        opts = {
            indent = { enable = false },
            ensure_installed = {
                "c",
                "vim",
                -- "help",
                "lua",
                "cpp",
                "go",
                "python",
                "javascript",
                "typescript",
                "markdown",
                "markdown_inline",
                "regex",
                "vimdoc",
            },
            sync_install = false,
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>",
                    node_incremental = "<c-space>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<c-backspace>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["ay"] = "@parameter.outer",
                        ["iy"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["az"] = "@statement.outer",
                        ["il"] = "@loop.inner",
                        ["al"] = "@loop.outer",
                        ["id"] = "@conditional.inner",
                        ["ad"] = "@conditional.outer",
                        ["ir"] = "@assignment.rhs",
                        ["ar"] = "@assignment.lhs",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
                swap = {
                    enable = false,
                    swap_next = {
                        ["<leader>a"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner",
                    },
                },
            },
            playground = {
                enable = true,
                disable = {},
                updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = "o",
                    toggle_hl_groups = "i",
                    toggle_injected_languages = "t",
                    toggle_anonymous_nodes = "a",
                    toggle_language_display = "I",
                    focus_language = "f",
                    unfocus_language = "F",
                    update = "R",
                    goto_node = "<cr>",
                    show_help = "?",
                },
            },
            query_linter = {
                enable = false,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
        },
        ---@diagnostic disable-next-line: unused-local
        config = function(plugin, opts)
            require("nvim-treesitter.configs").setup(opts)
            vim.cmd([[set foldmethod=expr]])
            vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
            vim.cmd([[set nofoldenable]])
        end,
    },
    { "nvim-treesitter/playground", lazy = true, cmd = { "TSPlaygroundToggle" } },
}
