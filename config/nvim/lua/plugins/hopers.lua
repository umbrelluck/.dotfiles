return {
	-----------------
	---- FZF Lua ----
	-----------------
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-mini/mini.icons" },
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = {
			keymap = {
				builtin = { ["<M-e>"] = "hide" },
			},
		},
		---@diagnostic enable: missing-fields
	},
	-------------
	---- Oil ----
	-------------
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			columns = {
				"icon",
				"permissions",
				"size",
			},
			win_options = {
				signcolumn = "yes",
				winbar = "%!v:lua.get_oil_winbar()",
			},
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["g?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["<C-s>"] = { "actions.select", opts = { vertical = true } },
				["|"] = { "actions.select", opts = { vertical = true } },
				["<C-h>"] = { "actions.select", opts = { horizontal = true } },
				["\\"] = { "actions.select", opts = { horizontal = true } },
				["<C-t>"] = { "actions.select", opts = { tab = true } },
				["<C-p>"] = "actions.preview",
				["<C-c>"] = { "actions.close", mode = "n" },
				["<m-e>"] = { "actions.close", mode = "n" },
				["<C-l>"] = "actions.refresh",
				["-"] = { "actions.parent", mode = "n" },
				["_"] = { "actions.open_cwd", mode = "n" },
				["`"] = { "actions.cd", mode = "n" },
				["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
				["gs"] = { "actions.change_sort", mode = "n" },
				["gx"] = "actions.open_external",
				["g."] = { "actions.toggle_hidden", mode = "n" },
				["g\\"] = { "actions.toggle_trash", mode = "n" },
			},
			progress = { border = "rounded" },
			float = { border = "rounded" },
			ssh = { border = "rounded" },
			keymaps_help = { border = "rounded" },
		},
		dependencies = { "nvim-mini/mini.icons" },
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	-----------------
	---- Trouble ----
	-----------------
	{
		"folke/trouble.nvim",
		opts = {
			keys = {
				["\\"] = "jump_split",
				["|"] = "jump_vsplit",
			},
		},
		cmd = "Trouble",
	},
	--------------
	---- TODO ----
	--------------
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}
