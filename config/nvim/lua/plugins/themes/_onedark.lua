return { {
    "navarasu/onedark.nvim",
    enabled = false,
    priority = 1000,
    lazy = false,
    event = "VeryLazy",
    opts = {
        style = "warm",
        transparent = false,          -- Show/hide background
        ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- toggle theme style ---
        toggle_style_key = "<Leader>ct",                                                     -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

        code_style = {
            comments = 'italic',
            keywords = 'none',
            functions = 'none',
            strings = 'none',
            variables = 'none'
        },

        -- Lualine options --
        lualine = {
            transparent = true, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {},     -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
            darker = true,      -- darker colors for diagnostic
            undercurl = true,   -- use undercurl instead of underline for diagnostics
            background = false, -- use background color for virtual text
        },
    },
    config = function(_, opts)
        require("onedark").setup(opts)
        require("onedark").load()
    end,
} }
