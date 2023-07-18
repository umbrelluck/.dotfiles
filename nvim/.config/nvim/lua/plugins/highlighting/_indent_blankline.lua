return { {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        char_blankline = "┆", -- | ¦ ┆ ┊
        -- space_char_blankline = "",
        -- context_char_blankline="",
        -- contet_space_char_blankline="",
        show_current_context = true,
        show_current_context_start = true,
        show_current_context_start_on_current_line = true,
        use_treesitter = true,
        -- use_treesitter_scope = true,
        -- char_highlight_list = {
        --     "IndentBlanklineIndent1",
        --     "IndentBlanklineIndent2",
        --     "IndentBlanklineIndent3",
        --     "IndentBlanklineIndent4",
        --     "IndentBlanklineIndent5",
        --     "IndentBlanklineIndent6",
        -- },
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
        -- IndentBlanklineContextChar and IndentBlanklineChar
        -- vim.cmd([[highlight IndentBlanklineContextStart guisp=blue gui=underline]])
        -- vim.cmd([[highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline]])
        vim.cmd([[highlight IndentBlanklineIndent1 guifg=#FDC9C9 gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent2 guifg=#FFE7C9 gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent3 guifg=#FFFAC9 gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent4 guifg=#C9EFCB gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent5 guifg=#C9F4FB gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent6 guifg=#DBC9E9 gui=nocombine]])

        vim.cmd([[highlight IndentContext1 guisp=#FDC9C9 guifg=#FDC9C9 gui=nocombine]])
        vim.cmd([[highlight IndentContext2 guisp=#FFE7C9 guifg=#FFE7C9 gui=nocombine]])
        vim.cmd([[highlight IndentContext3 guisp=#FFFAC9 guifg=#FFFAC9 gui=nocombine]])
        vim.cmd([[highlight IndentContext4 guisp=#C9EFCB guifg=#C9EFCB gui=nocombine]])
        vim.cmd([[highlight IndentContext5 guisp=#C9F4FB guifg=#C9F4FB gui=nocombine]])
        vim.cmd([[highlight IndentContext6 guisp=#DBC9E9 guifg=#DBC9E9 gui=nocombine]])

        require("indent_blankline").setup(opts)
    end,
} }
