return {
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
        config = function()
            vim.g.tmux_navigator_no_wrap = 1
        end
    },
    -- {
    --     "0x00-ketsu/maximizer.nvim",
    --     keys = {
    --         { "mm", "<cmd>lua require('maximizer').toggle()<CR>", desc = "Window maximizer toggle" },
    --         -- { "mm", "<cmd>lua require('maximizer').maximize()<CR>", desc = "Window maximizer maximize" },
    --         -- { "mr", "<cmd>lua require('maximizer').restore()<CR>",  desc = "Window maximizer restore" },
    --     },
    --     config = function()
    --         vim.api.nvim_set_keymap('n', 'mm', '<cmd>lua require("maximizer").toggle()<CR>',
    --             { desc = "Window maximizer toggle" })
    --         -- vim.api.nvim_set_keymap('n', 'mm', '<cmd>lua require("maximizer").maximize()<CR>',
    --         --     { silent = true, noremap = true })
    --         -- vim.api.nvim_set_keymap('n', 'mr', '<cmd>lua require("maximizer").restore()<CR>',
    --         --     { silent = true, noremap = true })
    --     end
    -- },
    {
        'declancm/maximize.nvim',
        opts = {
            default_keymaps = false
        },
        config = function(_, opts)
            require('maximize').setup(opts)

            _G.nmap("mm", "<Cmd>lua require('maximize').toggle()<CR>", { desc = "Toggle current window maximization" })
        end
    }
}
