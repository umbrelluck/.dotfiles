return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo = require("todo-comments")
            todo.setup({})

            _G.nmap("to", ":TodoTelescope<cr>", { desc = "ToDo in Telescope" })
            _G.nmap("<leader>to", ":TodoQuickFix<cr>", { desc = "ToDo in quick fix list" })
            _G.nmap("]o", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })

            _G.nmap("[o", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })
        end
    }
}
