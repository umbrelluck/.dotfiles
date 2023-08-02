return { {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            -- component_separators = { left = "", right = "" },
            component_separators = "|",
            section_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            disabled_filetypes = { "startup" },
        },
        sections = {
            lualine_a = {
                "mode",
                "filename",
            },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { _G.lsp_clients },
            lualine_x = {
                "encoding",
                "fileformat",
                "filetype",
            },
            lualine_y = {},
            lualine_z = { "progress", "location" },
        },
        inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
        },
    },
    -- config = function()
    -- vim.cmd([[
    -- augroup lualine_augroup
    --     autocmd!
    --     autocmd User LspProgressStatusUpdated lua lualine.refresh()
    -- augroup END
    -- ]])
    -- end,
} }
