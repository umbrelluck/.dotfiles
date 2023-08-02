return {
    {
        "sainnhe/everforest",
        config = function()
            vim.o.background = "dark"
            vim.g.everforest_background = "hard"
            vim.g.everforest_enable_italic = 1
            vim.g.everforest_diagnostic_virtual_text = "colored"
            vim.g.everforest_better_performance = 1
            -- let g:everforest_colors_override = {'bg0': ['#202020', '234'], 'bg2': ['#282828', '235']}
            -- available keys gound at `/path/to/everforest/autoload/everforest.vim`.
            vim.cmd.colorscheme("everforest")
        end
    }
}
