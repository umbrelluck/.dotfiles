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
            show_end = false,
            -- exclude = {
            --     language = { "gdscript" },
            -- },
        },
    },
    config = function(_, opts)
        local hooks = require("ibl.hooks")
        local rainbow_delimiters = require("rainbow-delimiters")

        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            -- vim.api.nvim_set_hl(0, highlight[1], { fg = "#FDC9C9" })
            -- vim.api.nvim_set_hl(0, highlight[2], { fg = "#FFFAC9" })
            -- -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            -- vim.api.nvim_set_hl(0, highlight[3], { fg = "#FFE7C9" })
            -- vim.api.nvim_set_hl(0, highlight[4], { fg = "#C9EFCB" })
            -- vim.api.nvim_set_hl(0, highlight[5], { fg = "#DBC9E9" })
            -- vim.api.nvim_set_hl(0, highlight[6], { fg = "#C9F4FB" })

            local c = _G.get_current_colors()
            vim.api.nvim_set_hl(0, highlight[1], { fg = c.red })
            vim.api.nvim_set_hl(0, highlight[2], { fg = c.yellow })
            -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = c.blue })
            vim.api.nvim_set_hl(0, highlight[3], { fg = c.orange })
            vim.api.nvim_set_hl(0, highlight[4], { fg = c.green })
            vim.api.nvim_set_hl(0, highlight[5], { fg = c.violet })
            vim.api.nvim_set_hl(0, highlight[6], { fg = c.cyan })
        end)

        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy["global"],
                commonlisp = rainbow_delimiters.strategy['local'],
            },
            query = {
                [""] = "rainbow-delimiters",
                -- lua = "rainbow-blocks",
            },
            highlight = highlight
        }

        require("ibl").setup(opts)

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
