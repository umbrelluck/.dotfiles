_G.LSPDsigns = {
    Error = "",
    Warn = "",
    Hint = "󰌶",
    Info = " ",
    Ok = "󰄴",
    Dprefix = "●",
    Breakpoint = "●",
    BreakpointCondition = "",
    BreakpointRejected = "",
    LogPoint = "",
    Stopped = ""
}

function _G.map(mode, btn, action, opts)
    local options = { noremap = true, silent = true, desc = "This keymap is set from custom lua file" }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, btn, action, options)
end

function _G.nmap(btn, action, opts)
    _G.map("n", btn, action, opts)
end

function _G.vmap(btn, action, opts)
    _G.map("v", btn, action, opts)
end

function _G.imap(btn, action, opts)
    _G.map("i", btn, action, opts)
end

function _G.emap(btn, action, opts)
    _G.map("", btn, action, opts)
end

function _G.xmap(btn, action, opts)
    _G.map("x", btn, action, opts)
end

_G.is_empty = function(str)
    return str == nil or str == ""
end

function _G.get_filename(path)
    local filename_with_relative_path = vim.fn.substitute(path, vim.fn.getcwd() .. "/", "", "")
    local filename = filename_with_relative_path:match("([^/]+)$")

    if is_empty(filename) then
        return " %f"
    end

    return filename
end

function _G.lsp_clients()
    local lsp = vim.lsp.status()
    if lsp then
        local name = lsp.name or ""
        local msg = lsp.message or ""
        local percentage = lsp.percentage or 0
        local title = lsp.title or ""
        -- return string.format(" %%<%s: %s %s (%s%%%%) ", name, title, msg, percentage)
        return name
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if next(clients) == nil then
        return ""
    end

    local c = {}
    for _, client in pairs(clients) do
        table.insert(c, client.name)
    end
    return " " .. table.concat(c, "|")
end

function _G.mod_hl_by_opts(hl_name, opts)
    local hl_id = vim.api.nvim_get_hl_id_by_name(hl_name)
    local hl_def = vim.api.nvim_get_hl(0, { id = hl_id })

    for k, v in pairs(opts) do hl_def[k] = v end
    vim.api.nvim_set_hl(0, hl_name, hl_def)
end

function _G.mod_hl_copy_existing(hl_name, existing_hl_name)
    local hl_def = vim.api.nvim_get_hl(0, { name = hl_name })
    local ex_def = vim.api.nvim_get_hl(0, { name = existing_hl_name }) --lualine_a_insert
    local new_def = vim.tbl_extend("force", {}, hl_def, ex_def)
    vim.api.nvim_set_hl(0, hl_name, new_def)
end

function _G.get_current_colors(theme_name)
    local colors = {
        red = "",
        orange = "",
        yellow = "",
        blue = "",
        green = "",
        violet = "",
        cyan = "",
        text = ""
    }
    theme_name = theme_name or vim.g.colors_name

    if (theme_name == "bamboo") then
        local c = require('bamboo.colors')
        colors.red = c.red
        colors.orange = c.orange
        colors.yellow = c.yellow
        colors.blue = c.blue
        colors.green = c.green
        colors.violet = c.purple
        colors.cyan = c.cyan
    elseif (theme_name == "edge") then
        local configuration = vim.fn['edge#get_configuration']()
        local c = vim.fn['edge#get_palette'](configuration.style, configuration.dim_foreground,
            configuration.colors_override)

        colors.red = c.red[1]
        colors.orange = c.yellow[1]
        colors.yellow = c.yellow[1]
        colors.blue = c.blue[1]
        colors.green = c.green[1]
        colors.violet = c.purple[1]
        colors.cyan = c.cyan[1]
    elseif (theme_name == "catppuccin-mocha") then
        local c = require("catppuccin.palettes").get_palette("mocha")

        colors.red = c.red
        colors.orange = c.peach
        colors.yellow = c.yellow
        colors.blue = c.blue
        colors.green = c.green
        colors.violet = c.lavender
        colors.cyan = c.teal
        colors.text = c.text
    elseif (theme_name == "catppuccin-macchiato") then
        local c = require("catppuccin.palettes").get_palette("macchiato")

        colors.red = c.red
        colors.orange = c.peach
        colors.yellow = c.yellow
        colors.blue = c.blue
        colors.green = c.green
        colors.violet = c.lavender
        colors.cyan = c.teal
        colors.text = c.text
    elseif (theme_name == "kanagawa") then
        --     local c = require("kanagawa.colors").setup().palette
        --
        --     colors.red = c.autumnRed
        --     colors.orange = c.samuraiRed
        --     colors.yellow = c.boatYellow2
        --     colors.blue = c.crystalBlue
        --     colors.green = c.autumnGreen
        --     colors.violet = c.springViolet1
        --     colors.cyan = c.waveAqua1
        --     colors.text = c.dragonWhite

        colors.red = "#C34043"
        colors.orange = "#E82424"
        colors.yellow = "#C0A36E"
        colors.blue = "#7E9CD8"
        colors.green = "#76946A"
        colors.violet = "#938AA9"
        colors.cyan = "#6A9589"
        colors.text = "#c5c9c5"
    end


    return colors
end

function _G.diagnostic_toggle()
    if vim.g.diagnostics_active then
        vim.g.diagnostics_active = false
        vim.diagnostic.enable(true)
    else
        vim.g.diagnostics_active = true
        vim.diagnostic.enable(false)
    end
end

local isLspDiagnosticsVisible = true
function _G.diagnostic_toggle_view()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        -- virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end

function _G.get_oil_winbar()
    local dir = require("oil").get_current_dir()
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end
