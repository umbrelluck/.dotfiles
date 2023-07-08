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


require("lazy").setup({
    -- =========== LSP ==========
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate"
    },
    "williamboman/mason-lspconfig.nvim",
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    'hrsh7th/nvim-cmp',      -- Autocompletion plugin
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip',         -- Snippets plugin
    'jose-elias-alvarez/null-ls.nvim',

    "windwp/nvim-autopairs",
    'windwp/nvim-ts-autotag',

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    "rcarriga/nvim-notify",
    {
        'folke/noice.nvim',
        dependencies = { 'MunifTanjim/nui.nvim' }
    },


    'numToStr/Comment.nvim',

    "ThePrimeagen/harpoon",
    {
        "jiaoshijie/undotree",
        dependencies = { "nvim-lua/plenary.nvim", },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    'akinsho/bufferline.nvim',


    'xiyaowong/nvim-transparent',
    -- =========== Highlighting ==========
    'HiPhish/nvim-ts-rainbow2',
    "lukas-reineke/indent-blankline.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    },

    -- =========== Themes ==========
    "navarasu/onedark.nvim",
})



-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerCompile
-- augroup end
-- ]])
--
-- local ensure_packer = function()
--     local fn = vim.fn
--     local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
--     if fn.empty(fn.glob(install_path)) > 0 then
--         fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
--         vim.cmd [[packadd packer.nvim]]
--         return true
--     end
--     return false
-- end
--
-- local packer_bootstrap = ensure_packer()
--
-- return require('packer').startup(function(use)
--     use 'wbthomason/packer.nvim'
--
--     -- =========== LSP ==========
--     use {
--         "williamboman/mason.nvim",
--         run = ":MasonUpdate"
--     }
--     use "williamboman/mason-lspconfig.nvim"
--     use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
--     use 'hrsh7th/nvim-cmp'      -- Autocompletion plugin
--     use 'hrsh7th/cmp-buffer'
--     use 'hrsh7th/cmp-path'
--     use 'hrsh7th/cmp-cmdline'
--     use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
--     use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
--     use 'L3MON4D3/LuaSnip'         -- Snippets plugin
--     use 'jose-elias-alvarez/null-ls.nvim'
--
--     use "windwp/nvim-autopairs"
--     use 'windwp/nvim-ts-autotag'
--
--     use {
--         'nvim-telescope/telescope.nvim', tag = '0.1.1',
--         requires = { 'nvim-lua/plenary.nvim' }
--     }
--
--     use "rcarriga/nvim-notify"
--     use { 'folke/noice.nvim',
--         requires = { 'MunifTanjim/nui.nvim' } }
--
--
--     use 'numToStr/Comment.nvim'
--
--     use "ThePrimeagen/harpoon"
--     use {
--         "jiaoshijie/undotree",
--         requires = { "nvim-lua/plenary.nvim", },
--     }
--
--     use {
--         'nvim-lualine/lualine.nvim',
--         requires = { 'nvim-tree/nvim-web-devicons', opt = true }
--     }
--
--     use 'akinsho/bufferline.nvim'
--
--
--     use 'xiyaowong/nvim-transparent'
--     -- =========== Highlighting ==========
--     use 'HiPhish/nvim-ts-rainbow2'
--     use "lukas-reineke/indent-blankline.nvim"
--     use {
--         "nvim-treesitter/nvim-treesitter",
--         run = function()
--             local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
--             ts_update()
--         end,
--     }
--
--     -- =========== Themes ==========
--     use "navarasu/onedark.nvim"
--
--     if packer_bootstrap then
--         require('packer').sync()
--     end
-- end)
