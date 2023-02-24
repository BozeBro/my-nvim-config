return {
    {
        "L3MON4D3/LuaSnip",
        version = "*",
        build = "make install_jsregexp",
        dependencies = {
            {
                "rafamadriz/friendly-snippets",
                config = function()
                    require("luasnip/loaders/from_vscode").lazy_load()
                end,
            },
        },
        keys = {
            {
                "<tab>",
                function()
                    return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
            },
            {
                "<tab>",
                function()
                    require("luasnip").jump(1)
                end,
                mode = "s",
            },
            {
                "<s-tab>",
                function()
                    require("luasnip").jump( -1)
                end,
                mode = { "i", "s" },
            },
        },
        config = function()
            -- local ls = require("luasnip")
            -- local s = ls.snippet
            -- local t = ls.text_node
            -- local i = ls.insert_node
            -- ls.add_snippets("go", {
            -- 	s("as", {
            -- 		-- variable := value
            -- 		i(1, "variable"),
            -- 		t(" := "),
            -- 		i(2, "value"),
            -- 	}),
            -- })
        end,
    },
}
