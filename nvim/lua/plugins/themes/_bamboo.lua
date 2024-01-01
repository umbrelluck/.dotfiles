return {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        -- NOTE: to use the light theme, set `vim.o.background = 'light'`
        style = 'vulgaris',                                       -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
        toggle_style_key = nil,                                   -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
        toggle_style_list = { 'vulgaris', 'multiplex', 'light' }, -- List of styles to toggle between
        transparent = false,                                      -- Show/hide background
        dim_inactive = false,                                     -- Dim inactive windows/buffers
        term_colors = true,                                       -- Change terminal color as per the selected theme style
        ending_tildes = false,                                    -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false,                             -- reverse item kind highlights in cmp menu

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
            comments = 'italic',
            conditionals = 'italic',
            keywords = 'none',
            functions = 'none',
            namespaces = 'italic',
            parameters = 'italic',
            strings = 'none',
            variables = 'none',
        },

        lualine = {
            transparent = false, -- lualine center bar transparency
        },

        -- Custom Highlights --
        -- Override default colors
        colors = {
            -- bright_orange = '#ff8800', -- define a new color
            -- green = '#00ffaa', -- redefine an existing color
        },
        -- Override highlight groups
        highlights = {
            -- ['@comment'] = { fg = '$green' },
            -- ['@string'] = { fg = '#e2c792' }, --fmt = 'bold'
        },

        -- Plugins Config --
        diagnostics = {
            darker = false,    -- darker colors for diagnostic
            undercurl = true,  -- use undercurl instead of underline for diagnostics
            background = true, -- use background color for virtual text
        },
    },
    config = function(_, opts)
        require("bamboo").setup(opts)
        require("bamboo").load()
        vim.api.nvim_set_hl(0, "Search", {})
    end,
}
