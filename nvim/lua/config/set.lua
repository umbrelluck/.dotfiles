-- Numbers relative and static
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.listchars = {
    tab = "> ",
    trail = "-",
    nbsp = "+",
    eol = "$",
}

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.textwidth = 0 -- for gq, default 0=79

vim.opt.wrap = false
vim.opt.wrapmargin = 3
vim.o.breakindent = false

vim.o.completeopt = 'menuone,noselect,preview'

-- vim.o.mouse = 'a'

vim.opt.autoread = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.wrap = true

vim.opt.laststatus = 3
-- local filename = _G.get_filename(vim.fn.expand("%"))
-- vim.opt_local.winbar = " " .. filename .. " %m %=%l:%v "
