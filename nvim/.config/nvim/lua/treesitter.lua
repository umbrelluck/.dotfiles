local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

local parser_dir = "~/.config/nvim/tree-sitter_parsers"
vim.opt.runtimepath:append(parser_dir)

treesitter.setup({
    ensure_installed = { "vimdoc", "c", "lua", "bash" },
 -- from windwp/nvim-ts-autotag
    sync_install = false,

    auto_install = true,

    ignore_install = {},

    parser_install_dir = parser_dir,

    query = 'rainbow-parens',
    strategy = require('ts-rainbow').strategy.global,

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
    },
    autotag = {
        enable = true, -- from windwp/nvim-ts-autotag
    }
})
