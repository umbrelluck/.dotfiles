vim.g.mapleader = " "
vim.g.maplocalleader = " "

_G.map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
_G.map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

_G.map("n", "\\z", ":verbose map ", { silent = false })

_G.map("n", "\\q", ":q<cr>")
_G.map("n", "\\w", ":w<cr>")
_G.map("n", "\\a", ":wq<cr>")
_G.map("n", "\\s", ":so<cr>", { silent = false })

_G.map("n", "<leader>pv", vim.cmd.Ex)
_G.map("n", "<A-a>", "ggVG", { noremap = false })

_G.map("n", "<Leader>hh", ":noh<cr>")
_G.map("n", "<Leader>hi", ":noh<cr>")

-- move lines
_G.map("n", "<a-j>", ":m .+1<CR>==")
_G.map("n", "<a-k>", ":m .-2<CR>==")
_G.map("i", "<a-j>", "<Esc>:m .+1<CR>==gi")
_G.map("i", "<a-k>", "<Esc>:m .-2<CR>==gi")
_G.map("v", "<a-j>", ":m '>+1<CR>gv=gv")
_G.map("v", "<a-k>", ":m '<-2<CR>gv=gv")

_G.map({ "n", "v" }, "<a-l>", ">>", { noremap = false })
_G.map({ "n", "i" }, "<a-h>", "<<", { noremap = false })
_G.map("i", "<a-l>", "<ESC>>>", { noremap = false })
_G.map("i", "<a-h>", "<ESC><<", { noremap = false })

-- buffers
_G.map("n", "]b", ":bnext<cr>")
_G.map("n", "[b", ":bprev<cr>")
_G.map("n", "<leader>0", ":b#<cr>")
_G.map("n", "vb", ":vert sb<cr>", { silent = false })
_G.map("n", "vc", ":sb<cr>", { silent = false })
_G.map("n", "vn", ":enew<cr>", { silent = false })

-- windows
_G.map("n", "<C-h>", "<C-w>h", { noremap = false })
_G.map("n", "<C-j>", "<C-w>j", { noremap = false })
_G.map("n", "<C-k>", "<C-w>k", { noremap = false })
_G.map("n", "<C-l>", "<C-w>l", { noremap = false })
_G.map("n", "<C-c>", "<C-w>c", { noremap = false })

_G.map("n", "<C-A-e>", "<C-w>=", { noremap = false })
_G.map("n", "<C-A-k>", "<C-w>+", { noremap = false })
_G.map("n", "<C-A-j>", "<C-w>-", { noremap = false })
_G.map("n", "<C-A-l>", "<C-w>>", { noremap = false })
_G.map("n", "<C-A-h>", "<C-w><", { noremap = false })

-- _G.map("n","<C->>", "<C-w>=", { noremap = false })

_G.map("n", "<Leader>=", ':exe "resize " . (winheight(0) * 3/2)<CR>')
_G.map("n", "<Leader>-", ':exe "resize " . (winheight(0) * 2/3)<CR>')

_G.map("n", "\\v", ":vsplit<cr>")
_G.map("n", "\\h", ":split<cr>")

--tabs
_G.map("n", "tk", ":tabnext<cr>")
_G.map("n", "]t", ":tabnext<cr>")
_G.map("n", "tj", ":tabNext<cr>")
_G.map("n", "[t", ":tabNext<cr>")
_G.map("n", "tn", ":tabnew<cr>")
_G.map("n", "tf", ":tabfind<cr>")
_G.map("n", "tq", ":tabclose<cr>")
_G.map("n", "tc", ":tabclose<cr>")

-- move line below to the end of current line
-- _G.map("n", "J", "mzJ`z")

-- _G.map("n", "<C-d>", "<C-d>zz")
-- _G.map("n", "<C-u>", "<C-u>zz")

--search stays in the middle
_G.map("n", "n", "nzzzv")
_G.map("n", "N", "Nzzzv")
--
-- greatest remap ever
_G.map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
_G.map({ "n", "v" }, "<leader>y", [["+y]])
_G.map("n", "<leader>Y", [["+Y]])

_G.map({ "n", "v" }, "<leader>dd", [["_d]])

-- _G.map("i", "<C-c>", "<Esc>")

_G.map("n", "Q", "<nop>")
-- _G.map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- _G.map("n", "<leader>f", vim.lsp.buf.format)

_G.map("n", "]c", "<cmd>cnext<CR>zz")
_G.map("n", "[c", "<cmd>cprev<CR>zz")
_G.map("n", "]l", "<cmd>lnext<CR>zz")
_G.map("n", "[l", "<cmd>lprev<CR>zz")

_G.map("n", "<leader>rl", ":so<cr>", { silent = false })

_G.map("n", "<leader>se", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace in whole file
_G.map("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })               -- make current file executable
