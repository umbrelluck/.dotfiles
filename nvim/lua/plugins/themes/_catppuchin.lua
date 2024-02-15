return {
    {
        "catppuccin/nvim",
        -- enabled = false,
        name = "catppuccin",
        priority = 1000,
        opts = {
            compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
            flavour = "macchiato", -- latte, frappe, macchiato, mocha
            background = {         -- :h background
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- disables setting the background color.
            show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
            term_colors = true,             -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false,            -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15,          -- percentage of the shade to apply to the inactive window
            },
            no_italic = false,              -- Force no italic
            no_bold = false,                -- Force no bold
            no_underline = false,           -- Force no underline
            styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" },    -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },

            color_overrides = {},
            custom_highlights = {},

            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                treesitter_context = false,
                -- notify = true,
                overseer = true,
                mini = true,
                harpoon = true,
                hop = true,
                fidget = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = true,
                },
                rainbow_delimiters = true,
                mason = true,
                neogit = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                navic = {
                    enabled = true,
                    -- custom_bg = "NONE", -- "lualine" will set background to mantle
                },
                notifier = {
                    enabled = true,
                },
                dap = {
                    enabled = true,
                    enable_ui = true, -- enable nvim-dap-ui
                },
                telescope = {
                    enabled = true,
                    -- style = "nvchad"
                },
                lsp_trouble = true,
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end
    }
}
