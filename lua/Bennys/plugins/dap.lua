return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function(_, opts)
			local dapui = require("dapui")
			dapui.setup(opts)
			vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Open Debugger" })
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function(_, opts)
			local dapui = require("nvim-dap-virtual-text")
			dapui.setup(opts)
			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

			-- local dap = require("dap")

			-- dap.listeners.after.event_initialized["dapui_config"] = function()
			--     dapui.open()
			-- end
			-- dap.listeners.before.event_terminated["dapui_config"] = function()
			--     dapui.close()
			-- end
			-- dap.listeners.before.event_exited["dapui_config"] = function()
			--     dapui.close()
			-- end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
			vim.keymap.set("n", "<leader>dB", function()
				dap.toggle_breakpoint(vim.fn.input("Breakpoint Condition"))
			end)

			vim.keymap.set("n", "<leader>dc", dap.continue)
			vim.keymap.set("n", "<leader>dso", dap.step_over)
			vim.keymap.set("n", "<leader>dsi", dap.step_into)
			vim.keymap.set("n", "<leader>dr", dap.repl.open)
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
