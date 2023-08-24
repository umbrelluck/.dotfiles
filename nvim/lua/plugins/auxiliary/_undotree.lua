return {
    "jiaoshijie/undotree",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "<leader>u" },
    opts = {
        float_diff = false,     -- using float window previews diff, set this `true` will disable layout option
        layout = "left_bottom", -- "left_bottom", "left_left_bottom"
        ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
        window = {
            winblend = 3, --transparency when floating
        },
        keymaps = {       --- + gj to move to parent node
            ["j"] = "move_next",
            ["k"] = "move_prev",
            ["J"] = "move_change_next",
            ["K"] = "move_change_prev",
            ["<cr>"] = "action_enter",
            ["p"] = "enter_diffbuf",
            ["q"] = "quit",
        },
    },
    config = function(_, opts)
        local undotree = require("undotree")
        undotree.setup(opts)
        _G.map("n", "<leader>u", undotree.toggle)
    end,
}
