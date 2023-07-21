vim.g.mapleader = " "

_G.map("n", "\\q", ":q<cr>")
_G.map("n", "\\w", ":w<cr>")
_G.map("n", "\\a", ":wq<cr>")

_G.map("n", "<leader>pv", vim.cmd.Ex)
_G.map("n", "<A-a>", "ggVG", { noremap = false })

_G.map("n", "<Leader>l", ":&&<cr>", { noremap = false })
_G.map("v", "<Leader>l", ":&&<cr>", { noremap = false })
_G.map("n", "<Leader>hh", ":noh<cr>")
_G.map("n", "<Leader>hi", ":noh<cr>")

-- move lines
_G.map("v", "J", ":m '>+1<CR>gv=gv")
_G.map("v", "K", ":m '<-2<CR>gv=gv")

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
_G.map("n", "<C-t>", "<C-w>=", { noremap = false })

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

_G.map({ "n", "v" }, "<leader>d", [["_d]])

-- _G.map("i", "<C-c>", "<Esc>")

_G.map("n", "Q", "<nop>")
-- _G.map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
_G.map("n", "<leader>f", vim.lsp.buf.format)

--[[ _G.map("n", "<C-k>", "<cmd>cnext<CR>zz")
_G.map("n", "<C-j>", "<cmd>cprev<CR>zz")
_G.map("n", "<leader>k", "<cmd>lnext<CR>zz")
_G.map("n", "<leader>j", "<cmd>lprev<CR>zz") ]]

_G.map("n", "<leader>ww", ":w<cr>", { silent = false })
_G.map("n", "<leader>rl", ":so<cr>", { silent = false })

_G.map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace in whole file
_G.map("n", "<leader>X", "<cmd>!chmod +x %<CR>", { silent = true })              -- make current file executable
