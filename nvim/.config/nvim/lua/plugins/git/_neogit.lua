local opts = {
    disable_commit_confirmation = true,
    integrations = {
        diffview = true,
    },
}

return { {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local neogit = require("neogit")
        neogit.setup(opts)
        _G.map("n", "<leader>ng", ":Neogit<cr>")
        _G.map("n", "\\g", ":Neogit<cr>")
    end
} }
