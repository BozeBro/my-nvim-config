return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "BufReadPre",
        config = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            local opts = {
                sources = {
                    null_ls.builtins.formatting.stylua.with({
                        filestypes = { "lua", "luau" },
                    }),
                    null_ls.builtins.completion.spell,
                    null_ls.builtins.formatting.goimports.with({
                        filetypes = { "go" },
                        command = { "goimports" },
                    }),
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = { "html", "css", "yaml", "markdown", "json" },
                    }),
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format()
                            end,
                        })
                    end
                end,
            }
            null_ls.setup(opts)
        end,
    },
}
