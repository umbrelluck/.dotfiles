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
    log = {
        enable = true,
        truncate = true,
        types = {
            git = true,
            profile = true,
        },
    },
    view = {
        adaptive_size = true,
        -- centralize_selection = false,
        -- width = 30,
        -- side = "left",
        -- signcolumn = "yes",
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    -- float = {
    --     enable = true,
    -- },
})
