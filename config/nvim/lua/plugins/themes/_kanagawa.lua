return {
    "rebelot/kanagawa.nvim",
    -- enabled = false,
    -- prioirty = 1000,
    -- lazy = false,
    -- event = "VeryLazy",
    opts = {
        compile = false,   -- enable compiling the colorscheme
        undercurl = false, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {             -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
            return {}
        end,
        theme = "wave",    -- Load "wave" theme when 'background' option is not set
        background = {     -- map the value of 'background' option to a theme
            dark = "wave", -- try "dragon" !
            light = "lotus"
        },
    },
    config = function(_, opts)
        require('kanagawa').setup(opts)

        vim.cmd("colorscheme kanagawa")
    end
}
