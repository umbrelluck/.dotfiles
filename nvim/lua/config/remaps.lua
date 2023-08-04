vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- _G.map("", "<left>", "<nop>")
-- _G.map("", "<up>", "<nop>")
-- _G.map("", "<right>", "<nop>")
-- _G.map("", "<down>", "<nop>")

_G.map(_G.mods.n, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
_G.map(_G.mods.n, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

_G.map(_G.mods.n, "\\z", ":verbose map ", { silent = false })

_G.map(_G.mods.n, "\\q", ":q<cr>")
_G.map(_G.mods.n, "\\w", ":w<cr>")
_G.map(_G.mods.n, "\\a", ":wq<cr>")
_G.map(_G.mods.n, "\\s", ":so<cr>", { silent = false })

_G.map(_G.mods.n, "<leader>pv", vim.cmd.Ex)
_G.map(_G.mods.n, "<A-a>", "ggVG", { noremap = false })

_G.map(_G.mods.n, "<Leader>hh", ":noh<cr>")
_G.map(_G.mods.n, "<Leader>hi", ":noh<cr>")

-- move lines
_G.map(_G.mods.n, "<a-j>", ":m .+1<CR>==")
_G.map(_G.mods.n, "<a-k>", ":m .-2<CR>==")
_G.map(_G.mods.i, "<a-j>", "<Esc>:m .+1<CR>==gi")
_G.map(_G.mods.i, "<a-k>", "<Esc>:m .-2<CR>==gi")
_G.map(_G.mods.v, "<a-j>", ":m '>+1<CR>gv=gv")
_G.map(_G.mods.v, "<a-k>", ":m '<-2<CR>gv=gv")

_G.map({ _G.mods.n, _G.mods.v }, "<a-l>", ">>", { noremap = false })
_G.map({ _G.mods.n, _G.mods.i }, "<a-h>", "<<", { noremap = false })
_G.map(_G.mods.i, "<a-l>", "<ESC>>>", { noremap = false })
_G.map(_G.mods.i, "<a-h>", "<ESC><<", { noremap = false })

-- buffers
_G.map(_G.mods.n, "]b", ":bnext<cr>")
_G.map(_G.mods.n, "[b", ":bprev<cr>")
_G.map(_G.mods.n, "<leader>0", ":b#<cr>")
_G.map(_G.mods.n, "<c-v>", ":vert sb<cr>", { silent = false })
_G.map(_G.mods.n, "<c-b>", ":sb<cr>", { silent = false })
_G.map(_G.mods.n, "<c-n>", ":enew<cr>", { silent = false })
_G.map(_G.mods.n, "\\v", ":vsplit<cr>")
_G.map(_G.mods.n, "\\h", ":split<cr>")

-- windows
_G.map(_G.mods.n, "<C-h>", "<C-w>h", { noremap = false })
-- _G.map(_G.mods.n, "<left>", "<C-w>h", { noremap = false })
_G.map(_G.mods.n, "<C-j>", "<C-w>j", { noremap = false })
-- _G.map(_G.mods.n, "<down>", "<C-w>j", { noremap = false })
_G.map(_G.mods.n, "<C-k>", "<C-w>k", { noremap = false })
-- _G.map(_G.mods.n, "<up>", "<C-w>k", { noremap = false })
_G.map(_G.mods.n, "<C-l>", "<C-w>l", { noremap = false })
-- _G.map(_G.mods.n, "<right>", "<C-w>l", { noremap = false })
_G.map(_G.mods.n, "<C-c>", "<C-w>c", { noremap = false })

_G.map(_G.mods.n, "<C-A-e>", "5<C-w>=", { noremap = false })
_G.map(_G.mods.n, "<C-A-k>", "5<C-w>+", { noremap = false })
_G.map(_G.mods.n, "<C-A-j>", "5<C-w>-", { noremap = false })
_G.map(_G.mods.n, "<C-A-l>", "5<C-w>>", { noremap = false })
_G.map(_G.mods.n, "<C-A-h>", "5<C-w><", { noremap = false })

-- _G.map(_G.mods.n,"<C->>", "<C-w>=", { noremap = false })

_G.map(_G.mods.n, "<Leader>=", ':exe "resize " . (winheight(0) * 3/2)<CR>')
_G.map(_G.mods.n, "<Leader>-", ':exe "resize " . (winheight(0) * 2/3)<CR>')


--tabs
_G.map(_G.mods.n, "tk", ":tabnext<cr>")
_G.map(_G.mods.n, "]t", ":tabnext<cr>")
_G.map(_G.mods.n, "tj", ":tabNext<cr>")
_G.map(_G.mods.n, "[t", ":tabNext<cr>")
_G.map(_G.mods.n, "tn", ":tabnew<cr>")
_G.map(_G.mods.n, "tf", ":tabfind<cr>")
_G.map(_G.mods.n, "tq", ":tabclose<cr>")
_G.map(_G.mods.n, "tc", ":tabclose<cr>")

--better jumping

-- move line below to the end of current line
-- _G.map(_G.mods.n, "J", "mzJ`z")

-- _G.map(_G.mods.n, "<C-d>", "<C-d>zz")
-- _G.map(_G.mods.n, "<C-u>", "<C-u>zz")

--search stays in the middle
_G.map(_G.mods.n, "n", "nzzzv")
_G.map(_G.mods.n, "N", "Nzzzv")
--
-- greatest remap ever
_G.map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
_G.map({ _G.mods.n, _G.mods.v }, "<leader>y", [["+y]])
_G.map(_G.mods.n, "<leader>Y", [["+Y]])

_G.map({ _G.mods.n, _G.mods.v }, "<leader>dd", [["_d]])

-- _G.map(_G.mods.i, "<C-c>", "<Esc>")

_G.map(_G.mods.n, "Q", "<nop>")
-- _G.map(_G.mods.n, "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- _G.map(_G.mods.n, "<leader>f", vim.lsp.buf.format)

_G.map(_G.mods.n, "]c", "<cmd>cnext<CR>zz")
_G.map(_G.mods.n, "[c", "<cmd>cprev<CR>zz")
_G.map(_G.mods.n, "]l", "<cmd>lnext<CR>zz")
_G.map(_G.mods.n, "[l", "<cmd>lprev<CR>zz")

_G.map(_G.mods.n, "<leader>rl", ":so<cr>", { silent = false })

_G.map(_G.mods.n, "<leader>se", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace in whole file
_G.map(_G.mods.n, "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })               -- make current file executable
