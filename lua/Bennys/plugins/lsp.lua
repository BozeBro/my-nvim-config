local buf = vim.lsp.buf
local api = vim.api
local map = vim.keymap.set
return {
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        event = "BufReadPost",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
    },
    {
        {
            "folke/neodev.nvim",
            config = true,
            lazy = true,
        },
    },
    {
        "nvimdev/lspsaga.nvim",
        enabled = false,
        event = "BufReadPost",
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
            local servers = {}
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
                    { "i", "<c-k>", buf.hover, dscr("[LSP] Hover definition") },
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

            lspconfig.rust_analyzer.setup {
                on_attach = on_attach,
                flags = lsp_flags,
                -- TODO: Fix this https://github.com/hrsh7th/cmp-nvim-lsp/issues/72
                capabilities = vim.lsp.protocol.make_client_capabilities(),
                settings = {
                    ["rust-analyzer"] = {
                        rustfmt = { enable = true },
                        diagnostics = {
                            enable = true,
                            refreshSupport = false,
                        },
                    },
                },
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
                            rope_autoimport = { enabled = true },
                            rope_completion = { enabled = true },
                            mypy = { enabled = true },
                        },
                    },
                },
            }
            local home = vim.fn.expand("$HOME")
            lspconfig.lua_ls.setup {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            },
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                            -- library = vim.api.nvim_get_runtime_file("", true),
                        },
                    })
                end,
                settings = {
                    Lua = {},
                },
            }
            lspconfig.clangd.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "clangd", "--header-insertion=never" },
            }



            lspconfig.html.setup {
                cmd = { home .. "/.cargo/bin/htmx-lsp" },
            }
            lspconfig.millet.setup {
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities,
                filetypes = { "sml", "cm", "sig", "mlb" },
                cmd = { home .. "/millet/target/release/millet-ls" },
            }
            lspconfig.hls.setup {
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities,
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
