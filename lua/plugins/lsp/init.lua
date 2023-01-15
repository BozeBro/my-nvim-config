return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { 'folke/neodev.nvim', 'williamboman/mason.nvim', "williamboman/mason.nvim" },
	},
	{
		'folke/neodev.nvim',
		config = function()
			local map = vim.keymap.set
			local buf = vim.lsp.buf
			require 'neodev'.setup()
			local lspconfig = require 'lspconfig'
			local servers = { "sumneko_lua", "clangd", "pyright", "gopls" }
			local on_attach = function(client, bufnr)
				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				map('n', 'gD', buf.declaration, bufopts)
				map('n', 'gd', buf.definition, bufopts)
				map('n', 'K', buf.hover, bufopts)
				map('n', 'gi', buf.implementation, bufopts)
				map('n', '<C-k>', buf.signature_help, bufopts)
				map('n', '<space>wa', buf.add_workspace_folder, bufopts)
				map('n', '<space>wr', buf.remove_workspace_folder, bufopts)
				map('n', '<space>wl', function()
					print(vim.inspect(buf.list_workspace_folders()))
				end, bufopts)
				map('n', '<space>D', buf.type_definition, bufopts)
				map('n', '<space>rn', buf.rename, bufopts)
				map('n', '<space>ca', buf.code_action, bufopts)
				map('n', 'gr', buf.references, bufopts)
				map('n', '<space>f', function() buf.format { async = true } end, bufopts)
			end
			local lsp_flags = {}
			for _, v in ipairs(servers) do
				lspconfig[v].setup {
					on_attach = on_attach,
					flags = lsp_flags,
				}
			end

		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "sumneko_lua", "clangd", "pyright", "gopls" }
		},
		config = function(plugin, opts) require(plugin).setup(opts) end,
	},
	{
		'williamboman/mason.nvim',
		config = function() require("mason").setup() end
	},
}
