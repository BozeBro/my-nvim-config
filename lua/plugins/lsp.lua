local util = require("util")
local map = util.map
local buf = util.buf
local api = util.api
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

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				map("n", "gD", buf.declaration, bufopts)
				map("n", "gd", buf.definition, bufopts)
				map("n", "K", buf.hover, bufopts)
				map("n", "gi", buf.implementation, bufopts)
				map("n", "<C-k>", buf.signature_help, bufopts)
				map("n", "<leader>za", buf.add_workspace_folder, bufopts)
				map("n", "<leader>zr", buf.remove_workspace_folder, bufopts)
				map("n", "<leader>zl", function()
					print(vim.inspect(buf.list_workspace_folders()))
				end, bufopts)
				map("n", "<leader>D", buf.type_definition, bufopts)
				map("n", "<leader>rn", buf.rename, bufopts)
				map("n", "<leader>ca", buf.code_action, bufopts)
				map("n", "gr", buf.references, bufopts)
				map("n", "<leader>f", function()
					buf.format({ async = true })
				end, bufopts)
				-- Show diagnostics in a floating window
				map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

				-- Move to the previous diagnostic
				map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

				-- Move to the next diagnostic
				map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
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
