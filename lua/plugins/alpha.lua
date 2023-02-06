return {
	{
		"goolord/alpha-nvim",
		lazy = true,
		event = "VimEnter",
		keys = { "<leader>a", "<cmd>Alpha <cr>", desc = "Open home screen" },
		config = function(_, _)
			local alpha = require("alpha")
			--alpha.setup(require'alpha.themes.dashboard'.config)
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"██████╗░███████╗███╗░░██╗███████╗██████╗░██╗░█████╗░████████╗",
				"██╔══██╗██╔════╝████╗░██║██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝",
				"██████╦╝█████╗░░██╔██╗██║█████╗░░██║░░██║██║██║░░╚═╝░░░██║░░░",
				"██╔══██╗██╔══╝░░██║╚████║██╔══╝░░██║░░██║██║██║░░██╗░░░██║░░░",
				"██████╦╝███████╗██║░╚███║███████╗██████╔╝██║╚█████╔╝░░░██║░░░",
				"╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═════╝░╚═╝░╚════╝░░░░╚═╝░░░",
				" ",
				"              ░█████╗░███████╗██╗░░░██╗░█████╗░",
				"              ██╔══██╗╚════██║██║░░░██║██╔══██╗",
				"              ██║░░██║░░███╔═╝██║░░░██║███████║",
				"              ██║░░██║██╔══╝░░██║░░░██║██╔══██║",
				"              ╚█████╔╝███████╗╚██████╔╝██║░░██║",
				"              ░╚════╝░╚══════╝░╚═════╝░╚═╝░░╚═╝",
			}
			dashboard.section.buttons.val = {

				dashboard.button("f", "Find File", "<cmd>Telescope find_files <cr>"),
				dashboard.button("s", "Restore Session", [[<cmd>lua require("persistence").load() <cr>]]),
				dashboard.button("r", "Recent files", "<cmd>Telescope oldfiles <CR>"),
				dashboard.button("l", "Lazy", "<cmd>Lazy <cr>"),
				dashboard.button("c", "Config", "<cmd>e $MYVIMRC <CR>"),
				dashboard.button("q", "Quit", "<cmd>q <cr>"),
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end
			dashboard.section.footer.opts.hl = "Type"
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.opts.layout[1].val = 8
			alpha.setup(dashboard.config)
			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
}
