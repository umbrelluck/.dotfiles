return {
    'projekt0n/caret.nvim',
    -- lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    enabled = false,
    event = "VeryLazy",
    opts = {
        options = {
            transparent = false,    -- Set to true to disable background setting
            inverted_signs = false, -- Controls inverted Signcolumn highlighting
            styles = {              -- Define styles for various syntax groups
                bold = true,
                italic = true,
                strikethrough = true,
                undercurl = true,
                underline = true,
            },
            inverse = { -- Determines inverse highlights for different types
                match_paren = false,
                visual = false,
                search = false,
            },
        },
        mapping = {          -- Configure key mappings
            toggle_bg = nil, -- Assign a specific key for toggling background
        },
        groups = {},         -- Override default highlight groups here
    },
    config = function(_, opts)
        require('caret').setup(opts)

        vim.opt.background = 'dark'
        vim.cmd('colorscheme caret')
    end,
}
