return {
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            vim.cmd([[highlight RainbowDelimiterRed guifg=#FDC9C9]])
            vim.cmd([[highlight RainbowDelimiterOrange guifg=#FFE7C9]])
            vim.cmd([[highlight RainbowDelimiterYellow guifg=#FFFAC9]])
            vim.cmd([[highlight RainbowDelimiterGreen guifg=#C9EFCB]])
            vim.cmd([[highlight RainbowDelimiterCyan guifg=#C9F4FB]])
            -- vim.cmd([[highlight RainbowDelimiterBlue guifg=blue]])
            vim.cmd([[highlight RainbowDelimiterViolet guifg=#DBC9E9]])

            local rainbow_delimiters = require 'rainbow-delimiters'
            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    -- commonlisp = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    -- 'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
            }
        end
    }
}
