return {
    { "nvim-neotest/nvim-nio" },
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        enabled = false,
        keys = { "<leader>dt" },
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function(_, opts)
            local dapui = require("dapui")
            dapui.setup(opts)
            vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "[DBG] Open Debugger" })
        end,
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        enabled = false,
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
        enabled = false,
        lazy = true,
        config = function()
            local dap = require("dap")
            local map = vim.keymap.set
            map("n", "<leader>db", dap.toggle_breakpoint, { desc = "[DBG] toggle breakpoint" })
            map("n", "<leader>dB", function()
                dap.toggle_breakpoint(vim.fn.input("Breakpoint Condition"))
            end, { desc = "[DBG] toggle breakpoint Condition" })

            --    Default things that I can set for debug
            --    vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
            -- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
            -- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
            -- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
            -- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
            -- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
            -- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
            vim.keymap.set("n", "<Leader>dl", function()
                require("dap").run_last()
            end, { desc = "[DBG] run last" })
            -- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
            --   require('dap.ui.widgets').hover()
            -- end)
            vim.keymap.set("n", "<Leader>dff", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.frames)
            end, { desc = "[DBG] frames" })
            vim.keymap.set("n", "<Leader>ds", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes)
            end, { desc = "[DBG] Scopes" })

            map("n", "<leader>dc", dap.continue, { desc = "[DBG] continue" })
            -- map("n", "<leader>dn", dap.step_over, { desc = "[DBG] next" })
            map("n", "<leader>dso", dap.step_over, { desc = "[DBG] step over" })
            map("n", "<leader>dsi", dap.step_into, { desc = "[DBG] step into" })
            map("n", "<leader>dr", dap.repl.open, { desc = "[DBG] open repl" })
            map("n", "<leader>dh", function()
                require("dap.ui.widgets").hover()
            end, { desc = "[DBG] Hover " })
            map("n", "<leader>dp", function()
                require("dap.ui.widgets").preview()
            end, { desc = "[DBG] Preview" })
            map("n", "<leader>dr", dap.repl.open, { desc = "[DBG] repl open" })
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
            dap.adapters.lldb = {
                type = "executable",
                executable = {
                    command = "/Users/benedictozua/.vscode/extensions/lanza.lldb-vscode-0.2.3/bin/darwin/bin/lldb-vscode",
                    name = "lldb",
                    -- On windows you may have to uncomment this:
                    -- detached = false,
                },
            }
            local lldb_config = {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    ---@diagnostic disable-next-line: redundant-parameter
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            }
            local codelldb_config = {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    ---@diagnostic disable-next-line: redundant-parameter
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                terminal = "integrated",
            }

            dap.defaults.fallback.external_terminal = {
                command = "/Applications/kitty.app/Contents/MacOS/kitty",
            }

            dap.configurations.cpp = { codelldb_config }
            dap.configurations.c = dap.configurations.cpp
            dap.adapters.python = function(cb, config)
                if config.request == "attach" then
                    ---@diagnostic disable-next-line: undefined-field
                    local port = (config.connect or config).port
                    ---@diagnostic disable-next-line: undefined-field
                    local host = (config.connect or config).host or "127.0.0.1"
                    cb {
                        type = "server",
                        port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                        host = host,
                        options = {
                            source_filetype = "python",
                        },
                    }
                else
                    cb {
                        type = "executable",
                        -- command = "path/to/virtualenvs/debugpy/bin/python",
                        -- command = "home/projects/piano/env/bin/python3.10",
                        command = vim.fn.getcwd() .. "/env/debugpy/bin/python",
                        args = { "-m", "debugpy.adapter" },
                        options = {
                            source_filetype = "python",
                        },
                    }
                end
            end
            -- require("dap.ext.vscode").load_launchjs()
            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    -- pythonPath = function()
                    -- 	return "home/.pyenv/shims/python"
                    -- end,
                },
            }
        end,
    },
}
