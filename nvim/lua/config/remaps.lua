vim.g.mapleader = " "
vim.g.maplocalleader = " "

_G.map("t", "<A-n>", "<C-\\><C-n>", { noremap = false, silent = true, desc = "Go back to normal mode" })

_G.nmap("k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Better k motions" })
_G.nmap("j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Better j motions" })

_G.imap("<c-c>", "<Esc>", { noremap = false, desc = "alternative to Escape in insert mode" })

_G.nmap("\\z", ":verbose map ", { silent = false, desc = "Verbose map" })

_G.nmap("\\q", ":q<cr>", { desc = "Quit" })
_G.nmap("\\w", ":w<cr>", { desc = "Write" })
_G.nmap("\\a", ":wq<cr>", { desc = "Save and quit" })
_G.nmap("\\s", ":so<cr>", { silent = false, desc = "Source current file" })
_G.nmap("<leader>rl", ":so<cr>", { silent = false, desc = "Source current file" })

_G.nmap("<leader>pv", vim.cmd.Ex, { desc = "Open Explorer" })
_G.nmap("<A-a>", "ggVG", { noremap = false, desc = "Select all" })

_G.nmap("<Leader>hh", ":noh<cr>", { desc = "Remove highlight" })
_G.nmap("<Leader>hi", ":noh<cr>", { desc = "Remove highlight" })

-- move lines
_G.nmap("<a-j>", ":m .+1<CR>==", { desc = "Move line down" })
_G.nmap("<a-k>", ":m .-2<CR>==", { desc = "Move line up" })
_G.imap("<a-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
_G.imap("<a-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
_G.vmap("<a-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
_G.vmap("<a-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

_G.map({ "n", "v" }, "<a-l>", ">>", { noremap = false, desc = "Indent line right" })
_G.map({ "n", "i" }, "<a-h>", "<<", { noremap = false, desc = "Indent line left" })
_G.imap("<a-l>", "<ESC>>>", { noremap = false, desc = "Indent line right" })
_G.imap("<a-h>", "<ESC><<", { noremap = false, desc = "Indent line left" })

-- buffers
_G.nmap("]b", ":bnext<cr>", { desc = "Next buffer" })
_G.nmap("[b", ":bprev<cr>", { desc = "Previous buffer" })
_G.nmap("<c-n>", ":enew<cr>", { silent = false, desc = "Create new buffer" })
_G.nmap("\\b", ":bd<cr>", { desc = "Delete current buffer" })

-- windows
_G.nmap("<a-v>", ":vert sb<cr>", { silent = false, desc = "Create vertical split" })
_G.nmap("<a-V>", ":sb<cr>", { silent = false, desc = "Create horizontal split" })

_G.nmap("<C-h>", "<C-w>h", { noremap = false, desc = "Move to left window" })
_G.nmap("<C-left>", "<C-w>h", { noremap = false, desc = "Move to left window" })
_G.nmap("<C-j>", "<C-w>j", { noremap = false, desc = "Move to bottom window" })
_G.nmap("<C-down>", "<C-w>j", { noremap = false, desc = "Move to bottom window" })
_G.nmap("<C-k>", "<C-w>k", { noremap = false, desc = "Move to top window" })
_G.nmap("<C-up>", "<C-w>k", { noremap = false, desc = "Move to top window" })
_G.nmap("<C-l>", "<C-w>l", { noremap = false, desc = "Move to right window" })
_G.nmap("<C-right>", "<C-w>l", { noremap = false, desc = "Move to right window" })
_G.nmap("<C-q>", "<C-w>c", { noremap = false, desc = "Close current buffer" })

_G.nmap("<C-A-e>", "<C-w>=", { noremap = false, desc = "Resize all windows to the same size" })
_G.nmap("<C-A-k>", "5<C-w>+", { noremap = false, desc = "Increase window vertically by 5 rows" })
_G.nmap("<C-A-j>", "5<C-w>-", { noremap = false, desc = "Decrease window vertically by 5 rows" })
_G.nmap("<C-A-l>", "5<C-w>>", { noremap = false, desc = "Increase window horizontally by 5 columns" })
_G.nmap("<C-A-h>", "5<C-w><", { noremap = false, desc = "Decrease window horizontally by 5 columns" })

--tabs
-- _G.nmap("tk", ":tabnext<cr>", { desc = "Next tab" })
_G.nmap("]t", ":tabnext<cr>", { desc = "Next tab" })
_G.nmap("tj", ":tabNext<cr>", { desc = "Previous tab" })
_G.nmap("[t", ":tabNext<cr>", { desc = "Previous tab" })
_G.nmap("<m-t>", ":tabnew<cr>", { desc = "New tab" })
-- _G.nmap("tn", ":tabnew<cr>", { desc = "New tab" })
-- _G.nmap("tf", ":tabfind ", { silent = false, desc = "Open new tab and edit file inside" })
_G.nmap("<c-t>", ":tabclose<cr>", { desc = "Close tab" })
-- _G.nmap("tq", ":tabclose<cr>", { desc = "Close tab" })
-- _G.nmap("tc", ":tabclose<cr>", { desc = "Close tab" })

-- _G.nmap("tt", "t", { noremap = false, desc = "Add mapping to till character occurence" })

--better jumping
_G.nmap("<C-d>", "<C-d>zz", { desc = "<C-d> always stays in the middle of the screen" })
_G.nmap("<C-u>", "<C-u>zz", { desc = "<C-u> always stays in the middle of the screen" })

--search stays in the middle
_G.nmap("n", "nzzzv", { desc = "n stays in the middle of the screen" })
_G.nmap("N", "Nzzzv", { desc = "N stays in the middle of the screen" })

-- greatest remap ever
_G.xmap("<leader>p", [["_dP]], { desc = "Remebers what you pasted instead of what you pasted over" })
-- next greatest remap ever : asbjornHaland
_G.map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy selected to clipboard" })
_G.nmap("<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })

_G.map({ "n", "v" }, "<leader>dd", [["_d]], { desc = "Do not know what this is doing but too afraid to delete" })

_G.nmap("Q", "<nop>", { desc = "Q literally does nothing" })

_G.nmap("]e", "<cmd>cnext<CR>zz", { desc = "Next error in quickfix" })
_G.nmap("[e", "<cmd>cprev<CR>zz", { desc = "Previous error in quickfix" })
_G.nmap("]l", "<cmd>lnext<CR>zz", { desc = "Next entry in locallist" })
_G.nmap("[l", "<cmd>lprev<CR>zz", { desc = "Previous entry in locallist" })

_G.nmap("<leader>se", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { silent = false, desc = "Substitute in whole file" })
_G.nmap("<leader>X", "<cmd>!chmod +x %<CR>", { desc = "Make current file executable" })
