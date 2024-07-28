return { {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Neogit",
    keys = {
        { "<leader>ng", ":Neogit<cr>", desc = "Open [N]eo[G]it" },
        { "\\g",        ":Neogit<cr>", desc = "Open [N]eo[G]it" },
    },
    opts = {
        disable_commit_confirmation = true,
        integrations = {
            diffview = true,
            telescope = true,
        },
    }
} }
