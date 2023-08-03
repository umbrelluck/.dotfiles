return {
    {
        "mfussenegger/nvim-dap",
        keys = { "<leader>b" },
        config = function()
            local dap = require("dap")

            _G.map('n', '<F5>', function() dap.continue() end)
            _G.map('n', '<F10>', function() dap.step_over() end)
            _G.map('n', '<F11>', function() dap.step_into() end)
            _G.map('n', '<F12>', function() dap.step_out() end)
            _G.map('n', '<Leader>b', function() dap.toggle_breakpoint() end)
            _G.map('n', '<Leader>B', function() dap.set_breakpoint() end)
            _G.map('n', '<Leader>lp',
                function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
            _G.map('n', '<Leader>dr', function() dap.repl.open() end)
            _G.map('n', '<Leader>dl', function() dap.run_last() end)
            _G.map({ 'n', 'v' }, '<Leader>dh', function()
                require('dap.ui.widgets').hover()
            end)
            _G.map({ 'n', 'v' }, '<Leader>dp', function()
                require('dap.ui.widgets').preview()
            end)
            _G.map('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end)
            _G.map('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end)

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
        opts = {},
        keys = { "<leader>b" },
        config = function(_, opts)
            require("dapui").setup(opts)

            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            local sign = vim.fn.sign_define
            sign("DapBreakpoint", { text = _G.LSPDsigns.Breakpoint, texthl = "DapBreakpoint", linehl = "", numhl = "" })
            sign("DapBreakpointCondition",
                { text = _G.LSPDsigns.BreakpointCondition, texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
            sign("DapLogPoint", { text = _G.LSPDsigns.Logpoint, texthl = "DapLogPoint", linehl = "", numhl = "" })

            _G.map(_G.mods.n, "<leader>dk", ":lua require('dapui').float_element(<element ID>, <optional settings>)<CR>")
            _G.map(_G.mods.v, "<leader>de", ":lua require('dapui').eval()<CR>")
        end
    }
}
