return {
    {
        "SmiteshP/nvim-navic",
        opts = {
            highlight = true,
            depth_limit = 5,
            lsp = { auto_attach = true },
        }
    },
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
    }
}
