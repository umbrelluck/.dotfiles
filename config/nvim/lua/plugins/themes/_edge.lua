return {
    "sainnhe/edge",
    enabled = false,
    event = "VeryLazy",
    config = function()
        vim.g.edge_style = 'aura'
        vim.g.edge_better_performance = 1
        -- vim.cmd('colorscheme edge')
    end
}
