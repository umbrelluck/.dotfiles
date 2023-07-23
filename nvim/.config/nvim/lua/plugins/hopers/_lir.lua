return {

    {
        "tamago324/lir.nvim",
        dependencies = {
            { "tamago324/lir-git-status.nvim", opts = { show_ignored = true } },
            "tamago324/lir-bookmark.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        keys = { { "<leader>po", ":lua require('lir.float').toggle()<cr>", "Open Lir" } },
        config = function()
            -- vim.cmd([[highlight link LirGitStatusBracket Comment]])
            -- vim.cmd([[highlight link LirGitStatusIndex Special]])
            -- vim.cmd([[highlight link LirGitStatusWorktree WarningMsg]])
            -- vim.cmd([[highlight link LirGitStatusUnmerged ErrorMsg]])
            -- vim.cmd([[highlight link LirGitStatusUntracked Comment]])
            -- vim.cmd([[highlight link LirGitStatusIgnored Comment]])

            local actions = require('lir.actions')
            local mark_actions = require('lir.mark.actions')
            local clipboard_actions = require('lir.clipboard.actions')

            require 'lir'.setup({
                show_hidden_files = true,
                ignore = { "node_modules" }, -- { ".DS_Store", "node_modules" } etc.
                devicons = {
                    enable = true,
                    highlight_dirname = false
                },
                mappings = {
                    ['l']         = actions.edit,
                    ['<C-s>']     = actions.split,
                    ['<C-v>']     = actions.vsplit,
                    ['<C-t>']     = actions.tabedit,

                    ['h']         = actions.up,
                    ['q']         = actions.quit,

                    ['d']         = actions.mkdir,
                    ['%']         = actions.newfile,
                    ['R']         = actions.rename,
                    ['c']         = actions.cd,
                    ['y']         = actions.yank_path,
                    ['.']         = actions.toggle_show_hidden,
                    ['D']         = actions.delete,

                    ['J']         = function()
                        mark_actions.toggle_mark()
                        vim.cmd('normal! j')
                    end,
                    -- ['c']     = clipboard_actions.copy,
                    ['<leader>y'] = clipboard_actions.copy,
                    ['<leader>x'] = clipboard_actions.cut,
                    ['<s-c>v']    = clipboard_actions.paste,
                },
                float = {
                    winblend = 0,
                    curdir_window = {
                        enable = false,
                        highlight_dirname = false
                    },

                    -- You can define a function that returns a table to be passed as the third
                    -- argument of nvim_open_win().
                    win_opts = function()
                        local width = math.floor(vim.o.columns * 0.8)
                        local height = math.floor(vim.o.lines * 0.8)
                        return {
                            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                            width = width,
                            height = height,
                            row = 1,
                            col = math.floor((vim.o.columns - width) / 2),
                        }
                    end,
                },
                hide_cursor = false
            })

            vim.api.nvim_create_autocmd({ 'FileType' }, {
                pattern = { "lir" },
                callback = function()
                    -- use visual mode
                    vim.api.nvim_buf_set_keymap(
                        0,
                        "x",
                        "J",
                        ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
                        { noremap = true, silent = true }
                    )

                    -- echo cwd
                    vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
                end
            })

            -- custom folder icon
            require 'nvim-web-devicons'.set_icon({
                lir_folder_icon = {
                    icon = "",
                    color = "#7ebae4",
                    name = "LirFolderNode"
                }
            })
        end
    }
}
--
--
-- require'lir'.setup {
-- ...
--   mappings = {
--     -- ...
--     ['B']     = require'lir.bookmark.actions'.list,
--     ['ba']     = require'lir.bookmark.actions'.add,
--   },
-- }
--
--
-- local b_actions = require'lir.bookmark.actions'
-- require'lir.bookmark'.setup {
--   bookmark_path = '~/.lir_bookmark',
--   mappings = {
--     ['l']     = b_actions.edit,
--     ['<C-s>'] = b_actions.split,
--     ['<C-v>'] = b_actions.vsplit,
--     ['<C-t>'] = b_actions.tabedit,
--     ['<C-e>'] = b_actions.open_lir,
--     ['B']     = b_actions.open_lir,
--     ['q']     = b_actions.open_lir,
--   }
-- }
-- }
