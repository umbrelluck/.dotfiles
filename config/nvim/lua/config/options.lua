vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.spell = true
-- vim.opt.spelllang = {'en_us', 'uk'}

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1

vim.o.winborder = "rounded"

vim.opt.thesaurus:append(vim.fn.expand("~/.local/share/nvim/thesaurus/english"))
