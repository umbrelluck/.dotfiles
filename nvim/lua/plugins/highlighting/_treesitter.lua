return { {
    "nvim-treesitter/nvim-treesitter",
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
            autotag = {
                enable = true, -- from windwp/nvim-ts-autotag
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
            },
        })
    end,
},
    { "nvim-treesitter/nvim-treesitter-context" } }
