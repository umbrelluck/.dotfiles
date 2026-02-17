vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.spell = true
-- vim.opt.spelllang = {'en_us', 'uk'}

vim.opt.smarttab = true
vim.opt.expandtab = true 
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1

vim.opt.thesaurus:append(vim.fn.expand("~/.local/share/nvim/thesaurus/english"))
