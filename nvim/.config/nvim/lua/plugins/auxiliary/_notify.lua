local opts = {
    render = "compact",
    top_down = false,
    stages = "fade",
    timeout = 1500,
}

return { {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup(opts)
        vim.notify = require("notify")
    end,
} }
