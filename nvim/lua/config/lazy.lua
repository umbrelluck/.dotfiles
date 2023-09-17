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
    { import = "plugins.lsp" },
    { import = "plugins.autocmp" },
    { import = "plugins.build" },
    { import = "plugins.highlighting" },
    { import = "plugins.git" },
    { import = "plugins.debug" },
    { import = "plugins.hopers" },
    { import = "plugins.motions" },
    { import = "plugins.auxiliary" },
    { import = "plugins.visuals" },
    { import = "plugins.themes" },
}

local opts = {
    { defaults = { lazy = true } },
    { ui = { border = "rounded" } }
}

require("lazy").setup(specs, opts)
