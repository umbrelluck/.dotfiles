return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>ig", ":LazyGit<cr>",            desc = "[L]azy[G]it" },
        { "<leader>if", ":LazyGitFilter<cr>",      desc = "[L]azyGit [F]ilter" },
        { "<leader>ib", ":LazyGitCurrentFile<cr>", desc = "[L]azyGitCurrentFile ([B]uffer)" },
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
}
