function _G.map(mode, btn, action, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, btn, action, options)
end

_G.is_empty = function(str) return str == nil or str == "" end

function _G.get_filename(path)
    local filename_with_relative_path = vim.fn.substitute(path, vim.fn.getcwd() .. "/", "", "")
    local filename = filename_with_relative_path:match("([^/]+)$")

    if is_empty(filename) then
        return " %f"
    end

    return filename
end