local buf = vim.lsp.buf
local api = vim.api
local map = vim.keymap.set
return {
    {
        {
            "folke/neodev.nvim",
            config = true,
            lazy = true,
        },
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "BufReadPre",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons", -- optional
        },
        opts = {
            lightbulb = {
                enable = false,
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            "folke/neodev.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("neodev")
            local lspconfig = require("lspconfig")
            local servers = { "lua_ls", "gopls" }
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- Quiets warnings about different Unicode formats
            capabilities.offsetEncoding = { "utf-16" }
            local on_attach = function(_, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
                -- api.nvim_buf_set_option(bufnr, "omnifunc", "a")

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                local combine = function(a, b)
                    return vim.tbl_deep_extend("force", a, b)
                end
                local dscr = function(a)
                    return vim.tbl_deep_extend("force", bufopts, { desc = a })
                end
                local settings = {
                    {
                        "n",
                        "gi",
                        vim.lsp.buf.implementation,
                        dscr("[LSP] Go to implementation"),
                    },
                    {
                        "n",
                        "gD",

                        buf.declaration,
                        combine(bufopts, { desc = "[LSP] Go to declaration" }),
                    },
                    {
                        "n",
                        "gd",
                        buf.definition,
                        combine(bufopts, { desc = "[LSP] Go to Definition" }),
                    },
                    { "n", "K", buf.hover, dscr("[LSP] Hover definition") },
                    { "n", "<C-k>", buf.signature_help, dscr("[LSP] Signature Help") },
                    { "n", "<leader>za", buf.add_workspace_folder, dscr("[LSP] Add Workspace Folder") },
                    { "n", "<leader>zr", buf.remove_workspace_folder, dscr("[LSP] Remove Workspace Folder") },
                    {
                        "n",
                        "<leader>zl",
                        function()
                            print(vim.inspect(buf.list_workspace_folders()))
                        end,
                        dscr("[LSP] List workspace Folders"),
                    },
                    {
                        "n",
                        "<leader>f",
                        function()
                            buf.format { async = true }
                        end,
                        dscr("Format file"),
                    },
                    { "n", "<leader>D", buf.type_definition, dscr("[LSP] Type Definition") },
                    { "n", "<leader>rn", buf.rename, dscr("[LSP] rename") },
                    { "n", "<leader>ca", buf.code_action, dscr("[LSP] code Action") },
                    { "n", "gr", buf.references, dscr("[LSP] references") },
                    {
                        "n",
                        "gl",
                        "<cmd>lua vim.diagnostic.open_float()<cr>",
                        dscr("[LSP] Open Floating Diagnostic"),
                    },
                    {
                        "n",
                        "[d",
                        "<cmd>lua vim.diagnostic.goto_prev()<cr>",
                        dscr("[LSP] Go to Previous Diagnostic"),
                    },
                    {
                        "n",
                        "]d",
                        "<cmd>lua vim.diagnostic.goto_next()<cr>",
                        dscr("[LSP] Go to Next Diagnostic"),
                    },
                }
                for _, table in pairs(settings) do
                    local nTable = combine(bufopts, table)
                    ---@diagnostic disable-next-line: param-type-mismatch
                    map(unpack(nTable))
                end

                -- Show diagnostics in a floating window

                -- Move to the previous diagnostic

                -- Move to the next diagnostic
            end
            local lsp_flags = {}
            for _, v in ipairs(servers) do
                lspconfig[v].setup {
                    on_attach = on_attach,
                    flags = lsp_flags,
                    capabilities = capabilities,
                }
            end
            lspconfig.cmake.setup {
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities,
            }

            lspconfig.pylsp.setup {
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities,
                settings = {

                    pylsp = {
                        plugins = {
                            pyflakes = { enabled = false },
                            pylint = { enabled = false },
                            mccabe = { enabled = false },
                            pycodestyle = { enabled = false },
                            pyls_isort = { enabled = true },
                            -- rope_autoimport = { enabled = true },
                            -- rope_completion = { enabled = true },
                        },
                    },
                },
            }
            require("lspconfig")["clangd"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }

            lspconfig.tsserver.setup {
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities,
                cmd = { "typescript-language-server", "--stdio" },
            }
            lspconfig.html.setup {
                cmd = { "/Users/benedictozua/.cargo/bin/htmx-lsp" },
            }
            lspconfig.millet.setup {
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities,
                filetypes = { "sml", "cm", "sig", "mlb" },
                cmd = { "/Users/benedictozua/millet/target/release/millet-ls" },
            }
            -- local select_opts = {behavior = cmp.SelectBehavior.Select} ??
            local mslsp = require("mason-lspconfig")
            local ensure_installed = servers
            mslsp.setup { ensure_installed = ensure_installed }
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        lazy = true,
        config = true,
    },
}
