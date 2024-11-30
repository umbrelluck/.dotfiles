local function maximize_status()
    return vim.t.maximized and '   ' or ''
end

return { {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            -- component_separators = { left = "", right = "" },
            component_separators = "|",
            -- section_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = { "startup" },
        },
        sections = {
            lualine_a = { {
                "mode",
                -- maximize_status,
                -- "filename", -- .. vim.t.maximized and ' 🔍 ' or '',
                separator = { left = '' },
                right_padding = 2,
            } },
            lualine_b = { "filename", "branch", "diff", "diagnostics" },
            lualine_c = { maximize_status }, --_G.lsp_clients },
            lualine_x = {
                "encoding",
                "fileformat",
                -- "filetype",
            },
            lualine_y = { 'filetype', 'progress' },
            lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
        },
        inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { { "location", separator = { right = '' }, left_padding = 2 } },
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
