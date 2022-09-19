-----------------------------------------------------------
-- Plugin for reading lsp configs from json file
-----------------------------------------------------------

-- NOTE: Don`t know how to work with this
local status_ok, nlspsettings = pcall(require, 'nlspsettings')
if not status_ok then
    return
end

nlspsettings.setup({
    config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
    local_settings_dir = ".nlsp-settings",
    local_settings_root_markers = { '.git', 'README', 'README.md', 'CMakeLists.txt' },
    append_default_schemas = true,
    loader = 'json'
})
