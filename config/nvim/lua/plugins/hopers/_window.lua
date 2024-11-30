vim.api.nvim_set_hl(0, "BlackOnLightYellow", { fg = "#000000", bg = "#ebbcba" })

return {
    "yorickpeterse/nvim-window",
    enabled = false,
    keys = {
        { "<m-w>", function() require("nvim-window").pick() end, desc = "Pick window" }
    },
    opts = {
        chars = {
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
            'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
        },
        -- A group to use for overwriting the Normal highlight group in the floating
        -- window. This can be used to change the background color.
        normal_hl = 'BlackOnLightYellow',

        -- The highlight group to apply to the line that contains the hint characters.
        -- This is used to make them stand out more.
        hint_hl = 'highlight',

        -- The border style to use for the floating window.
        border = 'rounded'
    },
}
