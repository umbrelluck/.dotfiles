local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
	return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local telescope = require("telescope")
telescope.setup({
	defaults = {
	},
	extensions = {
	},
	pickers = {
		find_files = {
			find_command = {
				"rg",
				"--ignore",
				"--hidden",
				"--files"
			},
			live_grep = {
				"rg",
				"--ignore",
				"--hidden",
				"--files"
			},
		},
	},
})
