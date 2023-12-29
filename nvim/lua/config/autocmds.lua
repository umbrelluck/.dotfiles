_G.rainbow_highlight_group = vim.api.nvim_create_augroup("RainbowHighlights", { clear = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

local godot_autogroup = vim.api.nvim_create_augroup("Godot", { clear = true })
vim.api.nvim_create_autocmd("GodotTabTab", {
	callback = function()
		vim.cmd("set noexpandtab")
	end,
	group = godot_autogroup,
	pattern = "*.gd"
})
