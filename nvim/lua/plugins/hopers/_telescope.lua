return { {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
        }
    },
    config = function()
        local builtin = require("telescope.builtin")
        _G.map("n", "<leader>tt", ":Telescope<cr>")

        _G.map('n', '<leader>?', builtin.oldfiles,
            { desc = '[?] Find recently opened files' })
        _G.map('n', '<leader>so', builtin.oldfiles,
            { desc = '[?] Find recently opened files' })
        _G.map('n', '<leader><space>', builtin.buffers,
            { desc = '[ ] Find existing buffers' })
        _G.map('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 5,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        _G.map('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
        _G.map('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        _G.map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        _G.map('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        _G.map('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        _G.map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local trouble = require("trouble.providers.telescope")

        telescope.setup({
            defaults = {
                color_devicons = true,
                use_less = true,
                file_sorter = require("telescope.sorters").get_fuzzy_file,
                generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,

                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<C-c>"] = actions.close,
                        ["<CR>"] = actions.select_default + actions.center,

                        ["<c-t>"] = trouble.open_with_trouble,
                    },
                    n = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<C-c>"] = actions.close,

                        ["<c-t>"] = trouble.open_with_trouble,
                    },
                },
            },

            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--hidden" },
                },
                live_grep = {
                    additional_args = {
                        "--hidden",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                }
            }
        })

        -- telescope.load_extension("fzf")
        telescope.load_extension("notify")
    end,
} }
