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
        keys = { { "\\rd", ':lua require("nvim-navbuddy").open()<cr>', silent = true, desc = "Open navbuddy" } },
        opts = { lsp = { auto_attach = true } },
    }
}
