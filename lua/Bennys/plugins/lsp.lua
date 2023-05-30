local buf = vim.lsp.buf
local api = vim.api
local map = vim.keymap.set
return {
    {
        event = "BufReadPre",
        "neovim/nvim-lspconfig",
        dependencies = { "folke/neodev.nvim", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("neodev").setup()
            local lspconfig = require("lspconfig")
            local servers = { "lua_ls", "clangd", "pyright", "gopls" }
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
                local settings = {
                    {
                        "n",
                        "gD",
                        buf.declaration,
                        combine(bufopts, { desc = "Go to declaration" }),
                    },
                    { "n", "gd", buf.definition, combine(bufopts, { desc = "Go to Definition" }) },
                    { "n", "K", buf.hover, bufopts },
                    { "n", "<C-k>", buf.signature_help, bufopts },
                    { "n", "<leader>za", buf.add_workspace_folder, bufopts },
                    { "n", "<leader>zr", buf.remove_workspace_folder, bufopts },
                    {
                        "n",
                        "<leader>zl",
                        function()
                            print(vim.inspect(buf.list_workspace_folders()))
                        end,
                        bufopts,
                    },
                    {
                        "n",
                        "<leader>f",
                        function()
                            buf.format({ async = true })
                        end,
                        { desc = "Format file" },
                    },
                    { "n", "<leader>D", buf.type_definition, bufopts },
                    { "n", "<leader>rn", buf.rename, bufopts },
                    { "n", "<leader>ca", buf.code_action, bufopts },
                    { "n", "gr", buf.references, bufopts },
                    { "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>" },
                    { "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>" },
                    { "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>" },
                }
                for _, table in pairs(settings) do
                    local nTable = combine(bufopts, table)
                    map(unpack(nTable))
                end

                -- Show diagnostics in a floating window

                -- Move to the previous diagnostic

                -- Move to the next diagnostic
            end
            local lsp_flags = {}
            for _, v in ipairs(servers) do
                lspconfig[v].setup({
                    on_attach = on_attach,
                    flags = lsp_flags,
                    capabilities = capabilities,
                })
            end
            lspconfig.tsserver.setup({
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities,
                filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "typescript-language-server", "--stdio" },
            })
            -- local select_opts = {behavior = cmp.SelectBehavior.Select} ??
            local mslsp = require("mason-lspconfig")
            local ensure_installed = servers
            mslsp.setup({ ensure_installed = ensure_installed })
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        lazy = true,
        config = true,
    },
}
