return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-cmdline",
		},
		event = "InsertEnter",
		config = function()
			-- local autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					---@diagnostic disable-next-line: missing-parameter
					["<C-Space>"] = cmp.mapping.complete(),
					["<c-i>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-j>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-k>"] = cmp.mapping(function(fallback)
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
					{ name = "nvim_lsp", dup = 0 },
					{ name = "luasnip", dup = 0 },
					{ name = "buffer" },
				}),
			})
			-- cmp.event:on("confirm_done", autopairs.on_confirm_done())
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
		version = "<CurrentMajor>.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip/loaders/from_vscode").lazy_load()
			end,
		},
		config = true,
		--[[ opts = {
            history = true,
            delete_check_events = "TextChanged",
        }, ]]
	},
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp"},
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
}
