-----------------------------------------------------------
-- Plugin for project management
-----------------------------------------------------------

local status_ok, nproject = pcall(require, 'project_nvim')
if not status_ok then
    return
end


nproject.setup({
    manual_mode = false,

    detection_methods = { "pattern", "lsp" },
    -- detection_methods = { "lsp", "pattern" },

    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "CMakeLists.txt", "package.json", "README*", ">*.gops" },

    -- Table of lsp clients to ignore by name
    -- eg: { "efm", ... }
    ignore_lsp = {},

    -- Don't calculate root dir on specific directories
    -- Ex: { "~/.cargo/*", ... }
    exclude_dirs = {},

    show_hidden = false,

    silent_chdir = false,

    datapath = vim.fn.stdpath("data"),
})
