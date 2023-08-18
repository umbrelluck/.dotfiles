return {
    {
        "mfussenegger/nvim-dap",
        keys = { "<leader>b" },
        config = function()
            local dap = require("dap")

            _G.nmap("<F5>", function() dap.continue() end, { desc = "Dap contiue" })
            _G.nmap("<F10>", function() dap.step_over() end, { desc = "Dap step over" })
            _G.nmap("<F11>", function() dap.step_into() end, { desc = "Dap step into" })
            _G.nmap("<F12>", function() dap.step_out() end, { desc = "Dap step out" })
            _G.nmap("<Leader>b", function() dap.toggle_breakpoint() end, { desc = "Dap toggle breakpoint" })
            _G.nmap("<Leader>lp",
                function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
                { desc = "Dap set convoluted breakpoint" })
            _G.nmap("<Leader>dr", function() dap.repl.open() end, { desc = "Dap open reply" })
            _G.nmap("<Leader>dl", function() dap.run_last() end, { desc = "Dap run last" })
            _G.map({ "n", "v" }, "<Leader>dk", function()
                require("dap.ui.widgets").hover()
            end, { desc = "Dap hover" })
            _G.map({ "n", "v" }, "<Leader>dp", function()
                require("dap.ui.widgets").preview()
            end, { desc = "Dap preview" })
            _G.nmap("<Leader>df", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.frames)
            end, { desc = "Dap float" })
            _G.nmap("<Leader>ds", function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes)
            end, { desc = "Dap centered float" })

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

            _G.nmap("<leader>de", ":lua require('dapui').float_element(<element ID>, <optional settings>)<CR>",
                { desc = "Dap floating elements" })
            _G.vmap("<leader>dv", ":lua require('dapui').eval()<CR>", { desc = "Dap eval" })
        end
    }
}
