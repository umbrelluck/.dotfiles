return { {
    "windwp/nvim-autopairs",
    opts = {
        enable_check_bracket_line = false,
        ignored_next_char = "[%w%.]",
        fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = [=[[%'%"%>%]%)%}%,]]=],
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            manual_position = true,
            highlight = "Search",
            highlight_grey = "Comment",
        },
    },
    config = function()
        require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
} }
