return {
    {
        "nvimtools/none-ls.nvim",
        event = "BufReadPre",
        enabled = true,
        config = function()
            local null_ls = require("null-ls")
            local sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                -- null_ls.builtins.diagnostics.cpplint,
                null_ls.builtins.formatting.clang_format,
                -- null_ls.builtins.diagnostics.mypy,
                -- null_ls.builtins.formatting.rustfmt,
            }

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                pattern = { "*.rs" },
                callback = function()
                    vim.lsp.buf.format()
                end,
            })

            null_ls.setup {
                -- you can reuse a shared lspconfig on_attach callback here
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                -- vim.lsp.buf.formatting_sync()
                                vim.lsp.buf.format { bufnr = bufnr }
                            end,
                        })
                    end
                end,
                sources = sources,
            }
        end,
    },
    -- {
    --     'mhartington/formatter.nvim',
    --     config = true,
    -- }
}
