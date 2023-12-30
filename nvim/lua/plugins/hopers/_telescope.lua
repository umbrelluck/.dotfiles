return {
    {
        "nvim-telescope/telescope.nvim",
        -- tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            -- {
            --     "nvim-telescope/telescope-file-browser.nvim",
            --     dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }
            -- }
        },
        -- cmd = "Telesope",
        config = function()
            local builtin = require("telescope.builtin")
            _G.nmap("<leader>te", ":Telescope<cr>", { desc = "Open [TE]lescope" })

            _G.nmap('<leader>?', builtin.oldfiles,
                { desc = '[?] Find recently opened files' })
            _G.nmap('<leader><space>', builtin.buffers,
                { desc = '[ ] Find existing buffers' })
            _G.nmap('<leader>/', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 5,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            _G.nmap('<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
            _G.nmap('<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            _G.nmap('<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            _G.nmap('<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            _G.nmap('<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            _G.nmap('<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            _G.nmap("<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })

            _G.nmap("<leader>fb", ":Telescope file_browser<CR>", { desc = "[F]ile [B]rowser" })
            _G.nmap("<leader>fc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
                { desc = "[F]ile browser [C]urrent" })

            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local trouble = require("trouble.providers.telescope")

            telescope.setup({
                defaults = {
                    color_devicons = true,
                    use_less = true,
                    file_ignore_patterns = { "node_modules", "build", ".godot", "resources", "resource" },
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
                            ["<C-l>"] = actions.smart_send_to_loclist + actions.open_loclist,
                            ["<CR>"] = actions.select_default, -- + actions.center,
                            ["<C-c>"] = actions.close,
                            ["<c-p>"] = actions.drop_all,

                            ["<c-t>"] = trouble.open_with_trole,
                        },
                        n = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                            ["<C-l>"] = actions.smart_send_to_loclist + actions.open_loclist,
                            ["<CR>"] = actions.select_default, -- + actions.center,
                            ["<c-p>"] = actions.drop_all,
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
                    },
                    -- file_browser = {
                    --     theme = "ivy",
                    --     -- hijack_netrw = true,
                    -- }
                }
            })

            telescope.load_extension("fzf")
            -- telescope.load_extension("file_browser")
        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },

        config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                extensions = {
                    file_browser = {
                        theme = "ivy",
                        hijack_netrw = true,
                        promt_path = true,
                        hidden = { file_browser = true, folder_browser = true },
                        -- mappings = {
                        --     ["i"] = {
                        --         ["<cr>"] = actions.select_default,
                        --     },
                        --     ["n"] = {
                        --         ["<cr>"] = actions.select_default,
                        --     }
                        -- }
                    },
                },
            })

            require("telescope").load_extension("file_browser")
        end
    },
    {
        "nvim-telescope/telescope-project.nvim",
        keys = { {
            "<leader>sp",
            function()
                require("telescope").extensions.project.project({ display_type = "mininal" }) -- "full" | "minimal"
            end,
            desc = "Telescope [S]earch [P]rojects"
        } },
        config = function()
            local project_actions = require("telescope._extensions.project.actions")

            require("telescope").setup({
                extensions = {
                    project = {
                        -- base_dirs = {
                        --     '~/dev/src',
                        --     { '~/dev/src2' },
                        --     { '~/dev/src3',        max_depth = 4 },
                        --     { path = '~/dev/src4' },
                        --     { path = '~/dev/src5', max_depth = 2 },
                        -- },
                        hidden_files = true, -- default: false
                        theme = "dropdown",
                        order_by = "asc",
                        search_by = "title",
                        sync_with_nvim_tree = false,
                        -- default for on_project_selected = find project files
                        -- on_project_selected = function(prompt_bufnr)
                        --     -- Do anything you want in here. For example:
                        --     project_actions.change_working_directory(prompt_bufnr, false)
                        --     require("harpoon.ui").nav_file(1)
                        -- end
                    }
                }
            })
        end
    }

}
