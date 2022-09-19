-----------------------------------------------------------
-- Define Nvim settings
-----------------------------------------------------------

local opt = vim.opt -- behaves as set

opt.timeoutlen = 500

opt.number = true

opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.shiftwidth = 4
opt.tabstop = 4

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true
opt.wrap = true
opt.scrolloff = 5

opt.termguicolors = true

-- vim.cmd('set formatoptions-=cro') --no new comment line
vim.cmd [[ set completeopt-=menu ]]
vim.cmd [[ set completeopt-=menuone ]]
