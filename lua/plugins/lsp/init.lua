local map = vim.keymap.set
local buf = vim.lsp.buf
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { 'folke/neodev.nvim', 'williamboman/mason.nvim', "williamboman/mason.nvim" },
	},
	{
		'folke/neodev.nvim',
		config = function()
			require 'neodev'.setup()
			local lspconfig = require 'lspconfig'
			local servers = { "sumneko_lua", "clangd", "pyright", "gopls" }
			-- Add additional capabilities supported by nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(_, bufnr)
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
				map('n', '<leader>wa', buf.add_workspace_folder, bufopts)
				map('n', '<leader>wr', buf.remove_workspace_folder, bufopts)
				map('n', '<leader>wl', function()
					print(vim.inspect(buf.list_workspace_folders()))
				end, bufopts)
				map('n', '<leader>D', buf.type_definition, bufopts)
				map('n', '<leader>rn', buf.rename, bufopts)
				map('n', '<leader>ca', buf.code_action, bufopts)
				map('n', 'gr', buf.references, bufopts)
				map('n', '<leader>f', function() buf.format { async = true } end, bufopts)
				-- Show diagnostics in a floating window
				map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

				-- Move to the previous diagnostic
				map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

				-- Move to the next diagnostic
				map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
			end
			local lsp_flags = {}
			for _, v in ipairs(servers) do
				lspconfig[v].setup {
					on_attach = on_attach,
					flags = lsp_flags,
					capabilities = capabilities,
				}
			end
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			-- local select_opts = {behavior = cmp.SelectBehavior.Select} ??
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
					---@diagnostic disable-next-line: missing-parameter
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				}),
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		-- dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "sumneko_lua", "clangd", "pyright", "gopls" }
		},
		config = function(_, opts) require "mason-lspconfig".setup(opts) end,
	},
	{
		'williamboman/mason.nvim',
		config = function() require("mason").setup() end
	},
	{
		'hrsh7th/nvim-cmp',
		-- dependencies = { "cmp-buffer", "cmp-path", "cmp_luasnip", "cmp-nvim-lsp", "LuaSnip" },
	},
	'hrsh7th/cmp-buffer', "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip",
}
