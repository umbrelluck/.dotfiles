return {
    -- TODO: change to another notification provider
    {
        "rcarriga/nvim-notify",
        enabled = false,
        opts = {
            minimum_width = 30,
            timeout = 500,
            -- max_width = 50,
        },
    },
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            input = {},
            notifier = {},
            indent = {
                animate = { enabled = false },
            },
            statuscolumn = { enabled = false },
        },
    },
}
