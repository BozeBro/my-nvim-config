---@diagnostic disable: missing-fields
-- Some code I found online
-- Finds the nearest closer and will then escape it.

-- Similar to EscapePair but goes backwards

return {

	{
		"hrsh7th/nvim-cmp",
		version = "*",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"https://github.com/hrsh7th/cmp-omni",
		},
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			function EscapePair()
				local closers = { ")", "]", "}", ">", "'", '"', "`", "," }
				local line = vim.api.nvim_get_current_line()
				local row, col = unpack(vim.api.nvim_win_get_cursor(0))
				local after = line:sub(col + 1, -1)
				local closer_col = #after + 1
				local closer_i = nil
				for i, closer in ipairs(closers) do
					local cur_index, _ = after:find(closer)
					if cur_index and (cur_index < closer_col) then
						closer_col = cur_index
						closer_i = i
					end
				end
				if closer_i then
					vim.api.nvim_win_set_cursor(0, { row, col + closer_col })
					return true
				else
					vim.api.nvim_win_set_cursor(0, { row, col })
					return false
				end
			end

			-- My tabout function
			function EscapePairBackward()
				local closers = { "%(", "%[", "%{", "<", "'", '"', "`", "," }
				local line = vim.api.nvim_get_current_line()
				local row, col = unpack(vim.api.nvim_win_get_cursor(0))
				local after = line:sub(1, col)
				local closer_col = -1
				local closer_i = nil
				for i, closer in ipairs(closers) do
					-- regex = x[^x]*$ == Find first occurence of x
					-- where there is no x after it. Search until current position
					local regex = closer .. "[^" .. closer .. "]*$"
					local cur_index, _ = after:find(regex)
					if cur_index and (cur_index > closer_col) then
						closer_col = cur_index
						closer_i = i
					end
				end
				if closer_i then
					vim.api.nvim_win_set_cursor(0, { row, closer_col - 1 })
					return true
				else
					vim.api.nvim_win_set_cursor(0, { row, col })
					return false
				end
			end

			cmp.setup({
				preselect = cmp.PreselectMode.None,
				formatting = {
					format = lspkind.cmp_format({
						with_text = true,
						menu = {
							buffer = "[buf]",
							nvim_lsp = "[LSP]",
							luasnip = "[snip]",
							path = "[path]",
							cmdline = "[cmd]",
							omni = "[omni]",
						},
					}),
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					---@diagnostic disable-next-line: missing-parameter
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.SelectBehavior.Select,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							if not EscapePair() then
								fallback()
							end
						end
					end, { "i", "s", "n" }),
					["<S-Tab>"] = cmp.mapping(function(_)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							if not EscapePairBackward() then
								return "<Nop>"
							end
						end
					end, { "i", "s", "n" }),
					["<c-j>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-k>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "luasnip" },
					-- { name = "omni" },
					{ name = "nvim_lsp" },
				}, { { name = "buffer" } }),
			})
			cmp.event:on("confirm_done", autopairs.on_confirm_done())
			cmp.setup.cmdline("?", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline("/", {
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
	{ "hrsh7th/nvim-cmp", lazy = true },
	{ "hrsh7th/cmp-cmdline", lazy = true },
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{ "hrsh7th/cmp-buffer", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
	{ "onsails/lspkind.nvim", lazy = true },
	{ "https://github.com/hrsh7th/cmp-omni", lazy = true },
}
