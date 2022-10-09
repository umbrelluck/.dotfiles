-----------------------------------------------------------
-- Define Nvim settings
-----------------------------------------------------------

local opt = vim.opt -- behaves as set
local g = vim.g

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
opt.wrap = false
opt.scrolloff = 5

opt.termguicolors = true

opt.winwidth = 10
opt.winminwidth = 10
opt.equalalways = false
-- vim.cmd('set formatoptions-=cro') --no new comment line
-- vim.cmd [[ set completeopt-=menu ]]
-- vim.cmd [[ set completeopt-=menuone ]]

g.loaded = 1
g.loaded_netrwPlugin = 1
