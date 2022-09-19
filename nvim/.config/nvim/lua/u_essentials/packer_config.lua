-----------------------------------------------------------
-- Define and install plugins
-----------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Packer as popup
-- packer.init({
--   disaply = {
--     open_fn = function()
--       return require('packer.util').float({ border = 'rounded' })
--     end,
--   },
-- })

return packer.startup(function(use)

    --     ----- requirements
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"
    use 'kyazdani42/nvim-web-devicons'

    --     ----- apperance
    use 'sunjon/shade.nvim'
    use 'sainnhe/everforest'
    use 'folke/zen-mode.nvim'
    use 'RRethy/vim-illuminate'
    use "folke/todo-comments.nvim"
    use 'marko-cerovac/material.nvim' -- Themes plugin
    use "lukas-reineke/indent-blankline.nvim"

    --     ----- everyday helpers
    use 'folke/trouble.nvim'
    use "folke/which-key.nvim"
    use 'ojroques/nvim-bufdel'
    use 'glepnir/dashboard-nvim'
    use 'ahmedkhalf/project.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use { "akinsho/toggleterm.nvim", tag = '*' }
    use { 'akinsho/bufferline.nvim', tag = "v2.*" }
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    -- use 'sidebar-nvim/sidebar.nvim'
    -- use 'romgrk/barbar.nvim', -- open buffer tabs

    --     ----- lsp
    use 'glepnir/lspsaga.nvim'
    use 'neovim/nvim-lspconfig'
    use 'tamago324/nlsp-settings.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    --     ----- completition
    use 'L3MON4D3/LuaSnip' -- Snippets engine
    use 'saadparwaiz1/cmp_luasnip' -- luasnip completion source for nvim-cmp, bridge between engines
    use 'hrsh7th/nvim-cmp' -- Completion engine
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in language server client, provides server with clients` capabilities
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua' -- Neovims runtime API vim.lsp.*
    use 'hrsh7th/cmp-cmdline'
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    --     ----- debug
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    -- use "Pocco81/DAPInstall.nvim"
    -- use "Pocco81/dap-buddy.nvim"

    --     ----- code-related helpers
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'p00f/nvim-ts-rainbow'

    --     ----- tasks
    use 'Shatur/neovim-tasks'

    --     ----- git
    use 'lewis6991/gitsigns.nvim'
    use { 'akinsho/git-conflict.nvim', tag = '*' }

    --     ----- idk where to put them
    use 'lewis6991/impatient.nvim'
    use 'p00f/clangd_extensions.nvim'


    if packer_bootstrap then
        require('packer').sync()
    end
end)
