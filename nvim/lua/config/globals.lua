function _G.map(mode, btn, action, opts)
    local options = { noremap = true, silent = true, desc = "This keymap is set from custom lua file" }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, btn, action, options)
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
        table.insert(c, client.name)
    end
    return " " .. table.concat(c, "|")
end
