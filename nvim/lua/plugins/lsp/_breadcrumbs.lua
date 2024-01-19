return {
    {
        "SmiteshP/nvim-navic",
        event = "LspAttach",
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
        event = "LspAttach",
        keys = { { "<Leader>nv", ':lua require("nvim-navbuddy").open()<cr>', silent = true, desc = "Open navbuddy" } },
        opts = { lsp = { auto_attach = true } },
    }
}
