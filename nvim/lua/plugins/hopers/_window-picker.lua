return {
    "ten3roberts/window-picker.nvim",
    keys = {
        { '<m-w>', ":WindowPick<cr>", desc = "Pick Window" },
        { '<m-r>', ":WindowSwap<cr>", desc = "Swap Window" },
        { '<m-q>', ":WindowZap<cr>",  desc = "Zap Window" }
    },
    opts = {
        keys = 'alskdjfhgwoeiruty',
        -- Swap windows by holding shift + letter
        swap_shift = true,
        exclude = { qf = true, NvimTree = true, aerial = true },
        -- Flash the cursor line of the newly focused window for 300ms.
        -- Set to 0 or false to disable.
        flash_duration = false,
    },
    config = function(_, opts)
        require("window-picker").setup(opts)

        _G.mod_hl_copy_existing("WindowPicker", "lualine_a_normal") -- lualine_a_insert
        _G.mod_hl_copy_existing("WindowPickerSwap", "lualine_a_visual")
        _G.mod_hl_copy_existing("WindowPickerZap", "lualine_a_command")
    end
}
