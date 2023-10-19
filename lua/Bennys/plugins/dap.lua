return {
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		keys = { "<leader>dt" },
		dependencies = { "mfussenegger/nvim-dap" },
		config = function(_, opts)
			local dapui = require("dapui")
			dapui.setup(opts)
			vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Open Debugger" })
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		keys = { "<leader>d" },
		dependencies = { "mfussenegger/nvim-dap" },
		config = function(_, opts)
			local dapui = require("nvim-dap-virtual-text")
			dapui.setup(opts)
			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
		end,
	},
	{
		"mfussenegger/nvim-dap",
		keys = { "<leader>d" },
		lazy = true,
		config = function()
			local dap = require("dap")
			local map = vim.keymap.set
			map("n", "<leader>db", dap.toggle_breakpoint)
			map("n", "<leader>dB", function()
				dap.toggle_breakpoint(vim.fn.input("Breakpoint Condition"))
			end)

			map("n", "<leader>dc", dap.continue)
			map("n", "<leader>dso", dap.step_over)
			map("n", "<leader>dsi", dap.step_into)
			map("n", "<leader>dr", dap.repl.open)
			map("n", "<leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "Hover DBG" })
			map("n", "<leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "Preview DBG" })
			map("n", "<leader>dr", dap.repl.open)
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = "/Users/benedictozua/.vscode/extensions/vadimcn.vscode-lldb-1.9.1/adapter/codelldb",
					args = { "--port", "${port}" },
					-- On windows you may have to uncomment this:
					-- detached = false,
				},
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						---@diagnostic disable-next-line: redundant-parameter
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.c = dap.configurations.cpp
		end,
	},
}
