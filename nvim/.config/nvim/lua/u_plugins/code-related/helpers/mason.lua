-----------------------------------------------------------
-- Plugin for lsp installation
-----------------------------------------------------------

local status_ok, mason = pcall(require, 'mason')
if not status_ok then
    return
end

local mason_lsp
status_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not status_ok then
    return
end

local DEFAULT_SETTINGS_MASSON = {
    ui = {
        check_outdated_packages_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",

        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },

        keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
        },
    },

    -- The directory in which to install packages.
    -- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

    pip = {
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with package installations.
    log_level = vim.log.levels.INFO,

    max_concurrent_installers = 4,

    github = {
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
}

local DEFAULT_SETTINGS_MASSONLSP = {
    -- A list of servers to automatically install if they're not already installed.
    ensure_installed = { 'bashls', 'jsonls', 'sumneko_lua', 'clangd', 'pyright' },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = true,
}

mason.setup({
    ui = DEFAULT_SETTINGS_MASSON.ui
})
mason_lsp.setup({
    ensure_installed = DEFAULT_SETTINGS_MASSONLSP.ensure_installed
})

return { SERVERS_TO_INSTALL = DEFAULT_SETTINGS_MASSONLSP.ensure_installed }
