local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- =========== LSP ===========
    "_lspconfig",
    "_mason-lspconfig",
    "_mason",

    "_comment",
    "_trouble",

    -- =========== Highlighting ===========
    "_treesitter",
    "_indent_blankline",

    -- =========== AutoCMP ==========
    "_nvim-cmp",
    "_autopairs",
    "nvim-ts-autotag",

    -- =========== Git ==========
    "_neogit",
    "_diffview",
    "_gitsigns",

    -- =========== Files hopers ==========
    "_telescope",
    "_harpoon",

    -- =========== Auxiliary ==========
    "_notify",
    -- "_noice",
    "_undotree",
    "_lualine", --lsp-progress

    -- =========== Themes & Visuals ==========
    "_nvim-transparent",
    "_onedark",
}

local opts = {}

require("lazy").setup({
    { import = "plugins.lsp" },
    { import = "plugins.autocmp" },
    { import = "plugins.highlighting" },
    { import = "plugins.git" },
    { import = "plugins.hopers" },
    { import = "plugins.auxiliary" },
    { import = "plugins.visuals" },
    { import = "plugins.themes_visuals" },
}, { ui = { border = "rounded" } })
