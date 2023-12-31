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

        local wp_h = vim.api.nvim_get_hl(0, { name = "WindowPicker" })
        local lu_p_h = vim.api.nvim_get_hl(0, { name = "lualine_a_normal" }) --lualine_a_insert

        local ws_h = vim.api.nvim_get_hl(0, { name = "WindowPickerSwap" })
        local lu_s_h = vim.api.nvim_get_hl(0, { name = "lualine_a_visual" })

        local wz_h = vim.api.nvim_get_hl(0, { name = "WindowPickerZap" })
        local lu_z_h = vim.api.nvim_get_hl(0, { name = "lualine_a_command" })

        local nwp_h = vim.tbl_extend('force', {}, wp_h, lu_p_h)
        local nws_h = vim.tbl_extend('force', {}, ws_h, lu_s_h)
        local nwz_h = vim.tbl_extend('force', {}, wz_h, lu_z_h)

        vim.api.nvim_set_hl(0, "WindowPicker", nwp_h)
        vim.api.nvim_set_hl(0, "WindowPickerSwap", nws_h)
        vim.api.nvim_set_hl(0, "WindowPickerZap", nwz_h)
    end
}
