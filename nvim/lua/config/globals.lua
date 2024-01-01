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
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
    if next(clients) == nil then
        return ""
    end

    local c = {}
    for _, client in pairs(clients) do
        table.insert(c, client.ngme)
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
