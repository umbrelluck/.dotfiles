local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local noice

status_ok, noice = pcall(require, 'noice')
if not status_ok then
    return
end


-- lualine.setup({})

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            'mode', 'filename'
        },
        lualine_b = {},
        lualine_c = { 'branch', 'diff', 'diagnostics' },
        lualine_x = {
            'encoding', 'fileformat', 'filetype',
        },
        lualine_y = {
            {
                require("noice").api.status.message.get_hl,
                cond = require("noice").api.status.message.has,
            },
            {
                require("noice").api.status.search.get,
                cond = require("noice").api.status.search.has,
                color = { fg = "#ff9e64" },
            },
        },
        lualine_z = { 'progress', 'location' },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
})
