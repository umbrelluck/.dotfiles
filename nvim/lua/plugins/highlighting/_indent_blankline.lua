return { {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        -- char_blankline = "┆", -- | ¦ ┆ ┊
        -- space_char_blankline = "",
        -- context_char_blankline="",
        -- contet_space_char_blankline="",
        show_current_context = true,
        use_treesitter = true,
        -- use_treesitter_scope = true,
        context_highlight_list = {
            "IndentContext1",
            "IndentContext2",
            "IndentContext3",
            "IndentContext4",
            "IndentContext5",
            "IndentContext6",
        },
    },
    config = function(_, opts)
        vim.cmd([[highlight IndentContext1 guifg=#FDC9C9 gui=nocombine]])
        vim.cmd([[highlight IndentContext2 guifg=#FFE7C9 gui=nocombine]])
        vim.cmd([[highlight IndentContext3 guifg=#FFFAC9 gui=nocombine]])
        vim.cmd([[highlight IndentContext4 guifg=#C9EFCB gui=nocombine]])
        vim.cmd([[highlight IndentContext5 guifg=#C9F4FB gui=nocombine]])
        vim.cmd([[highlight IndentContext6 guifg=#DBC9E9 gui=nocombine]])

        require("indent_blankline").setup(opts)
    end,
} }
