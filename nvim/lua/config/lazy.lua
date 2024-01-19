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

local specs = {
    { import = "plugins.autocmp" },
    { import = "plugins.auxiliary" },
    { import = "plugins.btools" },
    { import = "plugins.debug" },
    { import = "plugins.git" },
    { import = "plugins.highlighting" },
    { import = "plugins.hopers" },
    { import = "plugins.lsp" },
    { import = "plugins.motions" },
    { import = "plugins.organization" },
    { import = "plugins.themes" },
    { import = "plugins.visuals" },
}

local opts = {
    -- defaults = { lazy = true },
    -- install = { "bamboo" },
    ui = { border = "rounded" },
}

require("lazy").setup(specs, opts)
