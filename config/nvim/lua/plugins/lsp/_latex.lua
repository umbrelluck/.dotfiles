return {
    {
        "lervag/vimtex",
        -- dependecies = {
        --     'sirver/ultisnips',
        --     'ckunte/latex-snippets-vim',
        -- },
        init = function()
            -- Use init for configuration, don't use the more common "config".
            vim.g.vimtex_view_method = 'zathura'
            vim.g.vimtex_compiler_method = 'latexrun'

            -- vim.g.UltiSnipsExpandTrigger = '<tab>'
            -- vim.g.UltiSnipsJumpForwardTrigger = '<m-f>'
            -- vim.g.UltiSnipsJumpBackwardTrigger = '<m-b>'
        end
    },
}
