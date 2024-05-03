return {
	{
		"vhyrro/luarocks.nvim",
		-- enableddd = false,
		enabled = false,
		lazy = true,
		-- priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	},
	{

		"nvim-neorg/neorg",
		enabled = false,
		-- enableddd = false,
		-- lazy = false,
		dependencies = { "vhyrro/luarocks.nvim" },
		ft = "norg", -- lazy load on filetype
		cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.autocommands"] = {},
					["core.integrations.treesitter"] = {},
					["core.neorgcmd"] = {},
					["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
					["core.integrations.nvim-cmp"] = {},
					["core.concealer"] = { config = { icon_preset = "diamond" } },
					-- ["core.latex.renderer"] = {},
				},
			})
		end,
	},
	{
		"jbyuki/nabla.nvim",
		enabled = false,
		ft = "norg",

		config = function()
			vim.keymap.set("n", "<leader>p", ':lua require("nabla").popup({ border=rounded })<CR>')
			--       " Customize with popup({border = ...})  : `single` (default), `double`, `rounded'
			--
			require("nabla").enableddd_virt({
				autogen = true, -- auto-regenerate ASCII art when exiting insert mode
				silent = true, -- silents error messages
			})
		end,
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-neorg/neorg" },
	},
}
