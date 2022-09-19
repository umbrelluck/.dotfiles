-----------------------------------------------------------
-- Plugin for sidebar
-----------------------------------------------------------

local status_ok, sbar = pcall(require, 'sidebar-nvim')
if not status_ok then
    return
end

sbar.setup({
    open = true,
    sections = { "files", "git", "symbols", "todos", "diagnostics" },
    hide_statusline = true,
})
