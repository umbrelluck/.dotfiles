return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local todo = require("todo-comments")
            todo.setup({})

            _G.map(_G.mods.n, "to", ":TodoQuickFix<cr>")
            _G.map(_G.mods.n, "]o", function()
                require("todo-comments").jump_next()
            end, { desc = "Next todo comment" })

            _G.map(_G.mods.n, "[o", function()
                require("todo-comments").jump_prev()
            end, { desc = "Previous todo comment" })
        end
    }
}
