return {
    {
        "sainnhe/everforest",
        config = function()
            vim.o.background = "dark"
            vim.g.everforest_background = "hard"
            vim.g.everforest_better_performance = 1
            vim.cmd.colorscheme("everforest")
        end
    }
}
