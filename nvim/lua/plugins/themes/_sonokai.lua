return {
    "sainnhe/sonokai",
    config = function()
        vim.g.sonokai_style = 'default' -- 'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, `'espresso'`
        vim.g.sonokai_better_performance = 1
        vim.g.sonokai_enable_italic = 1
        vim.g.sonokai_diagnostic_virtual_text = "colored"

        -- vim.cmd.colorscheme("sonokai")
    end
}
