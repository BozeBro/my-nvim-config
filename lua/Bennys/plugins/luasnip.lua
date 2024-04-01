---@diagnostic disable: unused-local
return {
	{
		"L3MON4D3/LuaSnip",
		version = "*",
		build = "make install_jsregexp",
		event = "InsertEnter",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip/loaders/from_vscode").lazy_load()
				end,
			},
		},
		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local sn = ls.snippet_node
			local t = ls.text_node
			local i = ls.insert_node
			local f = ls.function_node
			local c = ls.choice_node
			local d = ls.dynamic_node
			local r = ls.restore_node
			local l = require("luasnip.extras").lambda
			local rep = require("luasnip.extras").rep
			local p = require("luasnip.extras").partial
			local m = require("luasnip.extras").match
			local n = require("luasnip.extras").nonempty
			local dl = require("luasnip.extras").dynamic_lambda
			local fmt = require("luasnip.extras.fmt").fmt
			local fmta = require("luasnip.extras.fmt").fmta
			local types = require("luasnip.util.types")
			local conds = require("luasnip.extras.conditions")
			local conds_expand = require("luasnip.extras.conditions.expand")
			-- Basic Example of how to make a text snippets
			-- Expanding snippet changees from world --> Hello World
			-- s("world", {
			-- })
			--
			-- ls.add_snippets("all", {
			--     s("ternary", {
			--         -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
			--         i(1, "cond"),
			--         t(" ? "),
			--         i(2, "then"),
			--         t(" : "),
			--         i(3, "else"),
			--     }),
			-- })
			local function fn(
				args, -- text from i(2) in this example i.e. { { "456" } }
				parent, -- parent snippet or parent node
				user_args -- user_args from opts.user_args
			)
				return "[" .. args[1][1] .. user_args .. "]"
			end

			ls.add_snippets({ "markdown", "latex" }, {
				s("<=", {
					t("\\geqslant "),
				}),
			})

			ls.add_snippets("sml", {
				s("let", {
					t({ "let", "    " }),
					i(1, "values"),
					t({ "", "in", "    " }),
					t({ "", "end", "" }),
				}, {}),
			})

			ls.add_snippets("all", {
				s({ trig = "b(%d+)", regTrig = true }, {
					f(function(args, snip)
						---@diagnostic disable-next-line: param-type-mismatch
						return string.rep("repeatme ", tonumber(snip.captures[1]))
					end, {}),
				}),
				s("trig", {
					i(1),
					t("<-i(1) "),
					f(
						fn, -- callback (args, parent, user_args) -> string
						{ 3 }, -- node indice(s) whose text is passed to fn, i.e. i(2)
						{ user_args = { "user_args_value" } } -- opts
					),
					t(" i(2)->"),
					i(0),
					t("<-i(2) i(0)->"),
					i(2),
					i(3),
				}),
			})
		end,
	},
}
