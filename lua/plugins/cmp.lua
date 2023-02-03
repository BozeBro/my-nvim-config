return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
<<<<<<< Updated upstream
=======
			"L3MON4D3/LuaSnip",
>>>>>>> Stashed changes
		},
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					---@diagnostic disable-next-line: missing-parameter
					["<C-Space>"] = cmp.mapping.complete(),
<<<<<<< Updated upstream
					["<c-i>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-j>"] = cmp.mapping(function(fallback)
=======
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
>>>>>>> Stashed changes
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
<<<<<<< Updated upstream
					["<C-k>"] = cmp.mapping(function(fallback)
=======
					["<S-Tab>"] = cmp.mapping(function(fallback)
>>>>>>> Stashed changes
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
<<<<<<< Updated upstream
					{ name = "luasnip" },
					{
						name = "buffer",
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
						},
					},
=======
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
>>>>>>> Stashed changes
				}),
			})
			cmp.event:on("confirm_done", autopairs.on_confirm_done())
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
<<<<<<< Updated upstream
		version = "<CurrentMajor>.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip/loaders/from_vscode").lazy_load()
			end,
		},
		config = true,
=======
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				local map = vim.keymap.set
				local ls = require("luasnip")

				local expand = function()
					print(ls.expand_or_jumpable())
					if ls.expand_or_jumpable() then
						ls.expand_or_jumpable()
					end
				end
				map({ "i", "s" }, "<C-k>", expand, { desc = "Expand Snippet", silent = true })

				require("luasnip/loaders/from_vscode").lazy_load()
			end,
		},
>>>>>>> Stashed changes
		--[[ opts = {
            history = true,
            delete_check_events = "TextChanged",
        }, ]]
	},
	{ "hrsh7th/nvim-cmp", lazy = true },
	{ "hrsh7th/cmp-cmdline", lazy = true },
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{ "hrsh7th/cmp-buffer", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
<<<<<<< Updated upstream
	{ "rafamadriz/friendly-snippets" },
=======
	{ "rafamadriz/friendly-snippets", lazy = true },
>>>>>>> Stashed changes
}
