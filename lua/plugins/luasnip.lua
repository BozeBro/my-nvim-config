return {
	{
		"L3MON4D3/LuaSnip",
		version = "*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip/loaders/from_vscode").lazy_load()
			end,
		},

		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node
			ls.add_snippets("go", {
				s("as", {
					-- variable := value
					i(1, "variable"),
					t(" := "),
					i(2, "value"),
				}),
			})
			-- vim.keymap.set({ "i", "s" }, "<c-b>", function()
			--     if ls.expand_or_jumpable() then
			--         ls.expand_or_jump()
			--     end
			-- )
		end,
	},
}
