-- :map [[ ?{<CR>w99[{
-- :map ][ /}<CR>b99]}
-- :map ]] j0[[%/{<CR>
-- :map [] k$][%?}<CR>

-- Toggle between English, Ukrainian, and Both
local current_spell_mode = 0
vim.keymap.set("n", "<leader>sp", function()
    current_spell_mode = (current_spell_mode + 1) % 4
    if current_spell_mode == 0 then
        vim.opt.spell = false
        print("Spell: Off")
    elseif current_spell_mode == 1 then
        vim.opt.spell = true
        vim.opt.spelllang = "en_us"
        print("Spell: English")
    elseif current_spell_mode == 2 then
        vim.opt.spell = true
        vim.opt.spelllang = "uk"
        print("Spell: Ukrainian")
    else
        vim.opt.spell = true
        vim.opt.spelllang = "en_us,uk"
        print("Spell: Both Eng & Ukr")
    end
end, { desc = "Cycle spell languages" })

-----------------------------------------
---- Better jump and search position ----
-----------------------------------------
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "<C-d> always stays in the middle of the screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "<C-u> always stays in the middle of the screen" })

vim.keymap.set("n", "n", "nzzzv", { desc = "n stays in the middle of the screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "N stays in the middle of the screen" })

------------------------
---- Clipboard Yank ----
------------------------
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Remebers what you pasted instead of what you pasted over" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy selected to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })

-----------------
---- QF List ----
-----------------
vim.keymap.set("n", "<M-j>", ":cnext<CR>", { desc = "Move down qf" })
vim.keymap.set("n", "<M-k>", ":cprev<CR>", { desc = "Move up qf" })

-----------------
---- FZF Lua ----
-----------------
vim.keymap.set("n", "<leader>fs", ":FzfLua<CR>", { desc = "FZF selector", silent = true })
vim.keymap.set("n", "<leader>fh", ":FzfLua helptags<CR>", { desc = "FZF help", silent = true })
vim.keymap.set("n", "<leader><leader>", ":FzfLua buffers<CR>", { desc = "FZF buffers", silent = true })
-- vim.keymap.set("n", "<leader>sc", ":FzfLua combine pickers=1;2", {desc = "FZF combine"})
vim.keymap.set(
    "n",
    "<leader>fl",
    ":FzfLua lsp_workspace_diagnostics<CR>",
    { desc = "FZF lsp workspace diagnostics", silent = true }
)
vim.keymap.set(
    "n",
    "<leader>fL",
    ":FzfLua lsp_document_diagnostics<CR>",
    { desc = "FZF lsp document diagnostics", silent = true }
)
vim.keymap.set("n", "<leader>fu", ":FzfLua resume<CR>", { desc = "FZF resume", silent = true })
vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>", { desc = "FZF file search", silent = true })
vim.keymap.set("n", "<leader>fg", ":FzfLua live_grep<CR>", { desc = "FZF live_grep search", silent = true })

-------------
---- Oil ----
-------------
vim.keymap.set("n", "<leader>fc", ":Oil<CR>", { desc = "Oil file manager", silent = true })
vim.keymap.set("n", "<leader>fm", ":Oil<CR>", { desc = "Oil file manager", silent = true })

-----------------
---- Trouble ----
-----------------
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
    "n",
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    { desc = "Buffer Diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
    "n",
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    { desc = "LSP Definitions / references / ... (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

--------------
---- TODO ----
--------------
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
vim.keymap.set("n", "<leader>tt", ":TodoTrouble<CR>", { desc = "Open Todos in Trouble" })
vim.keymap.set("n", "<leader>tu", ":TodoFzfLua<CR>", { desc = "Open Todos in FzfLua" })

----------------
---- Snacks ----
----------------
vim.keymap.set("n", "<leader>no", function()
    Snacks.notifier.show_history()
end, { desc = "Show notification history" })
vim.keymap.set("n", "<leader>ni", function()
    Snacks.notifier.hide()
end, { desc = "Hide all notifications on screen" })

vim.keymap.set("n", "<leader>br", function()
    Snacks.rename.rename_file()
end, { desc = "Rename current file with LSP being aware" })
