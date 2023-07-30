return { {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/playground" },
    build = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end,
    config = function()
        local parser_dir = "~/.config/nvim/tree-sitter_parsers"
        vim.opt.runtimepath:append(parser_dir)
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = { "vimdoc", "c", "lua", "bash" },
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            parser_install_dir = parser_dir,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-space>",
                    node_incremental = "<c-space>",
                    scope_incremental = "<c-s>",
                    node_decremental = "<a-space>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>i"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>I"] = "@parameter.inner",
                    },
                },
            },
            playground = {
                enable = false,
                disable = {},
                updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false, -- Whether the query persists across vim sessions
                keybindings = {
                    toggle_query_editor = "o",
                    toggle_hl_groups = "i",
                    toggle_injected_languages = "t",
                    toggle_anonymous_nodes = "a",
                    toggle_language_display = "I",
                    focus_language = "f",
                    unfocus_language = "F",
                    update = "R",
                    goto_node = "<cr>",
                    show_help = "?",
                },
            },
            autotag = {
                enable = true, -- from windwp/nvim-ts-autotag
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
            },
        })
    end,
},
    { "nvim-treesitter/nvim-treesitter-context", opts = { enable = true, max_lines = 1 } }
}
