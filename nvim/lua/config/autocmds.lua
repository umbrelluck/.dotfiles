_G.rainbow_highlight_group = vim.api.nvim_create_augroup("RainbowHighlights", { clear = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    group = highlight_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})

local highlight_ssearch_group = vim.api.nvim_create_augroup("SearchHighlight", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    group = highlight_ssearch_group,
    callback = function()
        vim.api.nvim_set_hl(0, "Search", {})
    end
})

vim.api.nvim_create_user_command("Cppath", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    -- vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

--  filetype: 'ft' | syntax: 'syntax'
local file_group = vim.api.nvim_create_augroup("FileTypes", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
    group = file_group,
    pattern = "hyprland.conf",
    callback = function() --  filetype: 'ft' | syntax: 'syntax'
        vim.cmd("set ft=config")
        vim.cmd("set syntax=config")
    end
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
    group = file_group,
    pattern = "requirements*.txt",
    callback = function()
        vim.cmd("set syntax=python")
    end
})

-- so that make files wont have tabs converted to spaces
vim.api.nvim_create_autocmd("FileType", {
    group = file_group,
    pattern = "make",
    callback = function()
        vim.cmd("setlocal noexpandtab")
    end
})

vim.api.nvim_create_autocmd("FileType", {
    group = file_group,
    pattern = ".tex",
    callback = function()
        -- vim.cmd("syntax enable")
    end
})

-- local godot_autogroup = vim.api.nvim_create_augroup("Godot", { clear = true })
-- vim.api.nvim_create_autocmd("GodotTabTab", {
-- 	callback = function()
-- 		vim.cmd("set noexpandtab")
-- 	end,
-- 	group = godot_autogroup,
-- 	pattern = "*.gd"
-- })

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
