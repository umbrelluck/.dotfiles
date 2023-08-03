return {
    {
        "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        -- event = "VimEnter",
        opts = {
            theme = "dashboard",
        },
        -- config = function(_, opts)
        --     require("startup").setup(opts)
        -- end
    }
}
