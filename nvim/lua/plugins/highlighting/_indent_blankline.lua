-- vim.api.nvim_create_autocmd("ColorScheme", {
--     group = _G.rainbow_highlight_group,
--     pattern = "*",
--     callback = function() -- has parameter ev
--         vim.cmd([[highlight IndentContext1 guifg=#FDC9C9 ]])
--         vim.cmd([[highlight IndentContext2 guifg=#FFE7C9 ]])
--         vim.cmd([[highlight IndentContext3 guifg=#FFFAC9 ]])
--         vim.cmd([[highlight IndentContext4 guifg=#C9EFCB ]])
--         vim.cmd([[highlight IndentContext5 guifg=#C9F4FB ]])
--         vim.cmd([[highlight IndentContext6 guifg=#DBC9E9 ]])
--     end
-- })

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    -- "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}


return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = "HiPhish/rainbow-delimiters.nvim",
    opts = {
        debounce = 100,
        indent = {
            char = "│",
            smart_indent_cap = true,
            -- highlight = highlight,
        },
        scope = {
            highlight = highlight,
            show_start = false,
        },
    },
    config = function(_, opts)
        local hooks = require("ibl.hooks")
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FDC9C9" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFFAC9" })
            -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FFE7C9" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#C9EFCB" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#DBC9E9" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#C9F4FB" })
        end)

        vim.g.rainbow_delimiters = { highlight = highlight }
        require("ibl").setup(opts)

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
