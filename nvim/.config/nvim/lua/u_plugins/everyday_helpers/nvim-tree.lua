-----------------------------------------------------------
-- Plugin for NvimTree file browser
-----------------------------------------------------------

local status_ok, ntree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

ntree.setup({
    -- nvim-project integration
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
    git = {
        enable = true,
        ignore = false,
    },
})
