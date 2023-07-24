return { {
    "navarasu/onedark.nvim",
    opts = {
        style = "warm",
        transparent = false,   -- Show/hide background
        ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden

        -- toggle theme style ---
        toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

        -- Lualine options --
        lualine = {
            transparent = true, -- lualine center bar transparency
        },
    },
    config = function(_, opts)
        require("onedark").setup(opts)
        -- require("onedark").load()
    end,
} }
