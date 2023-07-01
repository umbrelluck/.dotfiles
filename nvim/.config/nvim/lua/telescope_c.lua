local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
    return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local telescope = require("telescope")
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        find_command = { 'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden' },
        color_devicons = true,
        use_less = true,
        file_sorter = require 'telescope.sorters'.get_fuzzy_file,
        generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
        file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
        buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                ['<C-c>'] = actions.close,
                ['<CR>'] = actions.select_default + actions.center,
            },
            n = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                ['<C-c>'] = actions.close,
            }
        }
    },
    extensions = {
    },

    require("telescope").load_extension("notify")
})
