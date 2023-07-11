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
		build = ":MasonUpdate",
	},
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client

	"SmiteshP/nvim-navic",
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = { "MunifTanjim/nui.nvim" },
	},

	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"L3MON4D3/LuaSnip", -- Snippets plugin
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp

	"jose-elias-alvarez/null-ls.nvim",

	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	"rcarriga/nvim-notify",
	{
		"folke/noice.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
	},

	"numToStr/Comment.nvim",

	"ThePrimeagen/harpoon",
	{
		"jiaoshijie/undotree",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
		},
		config = function()
			require("lsp-progress").setup()
		end,
	},

	"akinsho/bufferline.nvim",

	"xiyaowong/nvim-transparent",

	-- =========== Git ==========
	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim",
			"nvim-lua/plenary.nvim",
		},
	},

	"lewis6991/gitsigns.nvim",

	-- =========== Highlighting ==========
	"HiPhish/nvim-ts-rainbow2",
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
