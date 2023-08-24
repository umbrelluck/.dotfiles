return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>lg", ":LazyGit<cr>",            desc = "[L]azy[G]it" },
        { "<leader>lf", ":LazyGitFilter<cr>",      desc = "[L]azyGit [F]ilter" },
        { "<leader>lb", ":LazyGitCurrentFile<cr>", desc = "[L]azyGitCurrentFile ([B]uffer)" },
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
}
