return {
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            _G.map("n", "<leader>lg", ":LazyGit<cr>")
            _G.map("n", "<leader>lf", ":LazyGitFilter<cr>")
            _G.map("n", "<leader>lb", ":LazyGitFilterCurrentFile<cr>")
            require("telescope").load_extension("lazygit")
        end,
    },
}
