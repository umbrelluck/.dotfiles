return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        keys = { "<leader>b" },
        config = function()
            local dap = require("dap")

            vim.fn.sign_define('DapBreakpoint',
                {
                    text = _G.LSPDsigns.Breakpoint,
                    texthl = 'DiagnosticError',
                    linehl = '',
                    numhl = 'DiagnosticError'
                })
            vim.fn.sign_define('DapBreakpointCondition',
                {
                    text = _G.LSPDsigns.BreakpointCondition,
                    texthl = 'DiagnosticError',
                    linehl = '',
                    numhl = 'DiagnosticError'
                })
            vim.fn.sign_define('DapBreakpointRejected',
                {
                    text = _G.LSPDsigns.BreakpointRejected,
                    texthl = 'DiagnosticError',
                    linehl = '',
                    numhl = 'DiagnosticError'
                })
            vim.fn.sign_define('DapLogPoint',
                {
                    text = _G.LSPDsigns.LogPoint,
                    texthl = 'DiagnosticWarn',
                    linehl = '',
                    numhl = 'DiagnosticWarn'
                })
            vim.fn.sign_define('DapStopped', {
                text = _G.LSPDsigns.Stopped, texthl = 'DiagnosticOK', linehl = '', numhl = 'DiagnosticOK'
            })

            _G.nmap("<F5>", function() dap.continue() end, { desc = "Dap contiue" })
            _G.nmap("<F8>", ":DapDisconnect<cr>", { desc = "Dap disconnect" })
            _G.nmap("<F9>", ":DapTerminate<cr>", { desc = "Dap terminate" })
            _G.nmap("<F10>", function() dap.step_over() end, { desc = "Dap step over" })
            _G.nmap("<F11>", function() dap.step_into() end, { desc = "Dap step into" })
            _G.nmap("<F12>", function() dap.step_out() end, { desc = "Dap step out" })



            _G.nmap("<Leader>b", function() dap.toggle_breakpoint() end, { desc = "Dap toggle breakpoint" })
            _G.nmap("<Leader>lp",
                function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
                { desc = "Dap set convoluted breakpoint" })
            _G.nmap("<Leader>dr", function() dap.repl.open() end, { desc = "Dap open reply" })
            _G.nmap("<Leader>dt", function() dap.run_last() end, { desc = "Dap run last" })

            _G.map({ "n", "v" }, "<Leader>dk", function()
                require("dap.ui.widgets").hover()
            end, { desc = "Dap hover" })
            _G.map({ "n", "v" }, "<Leader>dp", function()
                require("dap.ui.widgets").preview()
            end, { desc = "Dap preview" })
            _G.nmap("<Leader>def", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.frames)
            end, { desc = "Dap float frames" })
            _G.nmap("<Leader>des", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes)
            end, { desc = "Dap float scopes" })

            -- require("dapui") -- to open awaken dapui

            -- dap.adapters.after
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopAtEntry = true,
                },
                {
                    name = 'Attach to gdbserver :1234',
                    type = 'cppdbg',
                    request = 'launch',
                    MIMode = 'gdb',
                    miDebuggerServerAddress = 'localhost:1234',
                    miDebuggerPath = '/usr/bin/gdb',
                    cwd = '${workspaceFolder}',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                },
            }

            dap.configurations.rust = dap.configurations.cpp

            dap.adapters.godot = {
                type = "server",
                host = '127.0.0.1',
                port = 6006,
            }

            dap.configurations.gdscript = {
                {
                    type = "godot",
                    request = "launch",
                    name = "Launch scene",
                    project = "${workspaceFolder}",
                    launch_scene = true,
                }
            }

            -- dap.configurations.python = {
            --     {
            --         type = 'python',
            --         request = 'launch',
            --         name = "Launch file",
            --         program = "${file}",
            --         pythonPath = function()
            --             return '/usr/bin/python'
            --         end,
            --     },
            -- }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            { "folke/neodev.nvim", opts = { library = { plugins = { "nvim-dap-ui" }, types = true }, }, },
        },
        event = "VeryLazy",
        opts = {},
        keys = { "<leader>b" },
        config = function(_, opts)
            require("dapui").setup(opts)

            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            _G.nmap("<leader>dao", function() dapui.open() end, { desc = "Dapui open" })
            _G.nmap("<leader>dac", function() dapui.close() end, { desc = "Dapui close" })

            _G.nmap("<leader>deu", ":lua require('dapui').float_element(<element ID>, <optional settings>)<CR>",
                { desc = "Dap floating elements" })
            _G.vmap("<leader>dev", ":lua require('dapui').eval()<CR>", { desc = "Dap eval" })
        end
    }
}
