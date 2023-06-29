function _G.map(mode, btn,  action, opts)
	local options = { noremap = true, silent = true }
        if opts then
            options = vim.tbl_extend('force', options, opts)
        end
	vim.keymap.set(mode, btn, action, options)
end


vim.g.mapleader = " "
_G.map("n", "<leader>pv", vim.cmd.Ex)
_G.map("n", "<Leader>l", ":&&<cr>", {noremap = false})
_G.map("v", "<Leader>l", ":&&<cr>", {noremap = false})
_G.map('n', '<Leader>h', ':set hlsearch!<cr>')
