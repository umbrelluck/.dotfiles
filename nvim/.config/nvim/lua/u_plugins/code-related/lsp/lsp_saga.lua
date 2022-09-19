-----------------------------------------------------------
-- Plugin for better UI for LSP
-----------------------------------------------------------

local status_ok, saga = pcall(require, 'lspsaga')
if not status_ok then
    return
end

saga.init_lsp_saga({
    finder_action_keys = {
        open = "o",
        vsplit = "v",
        split = "h",
        tabe = "t",
        quit = "q",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    definition_action_keys = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>h',
        tabe = '<C-c>t',
        quit = 'q',
    },
    rename_action_quit = "<C-c>",
    rename_in_select = true,
})

