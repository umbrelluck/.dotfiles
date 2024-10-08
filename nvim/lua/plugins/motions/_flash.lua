return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            search = {
                enabled = false,
                highlight = { backdrop = true },
                jump = { history = true, register = true, nohlsearch = true },
            },
            char = {
                multi_line = false,
                jump_labels = true,
                search = { wrap = false, },
                jump = {
                    register = false,
                    -- when using jump labels, set to 'true' to automatically jump
                    -- or execute a motion when there is only one match
                    autojump = true,
                },
            }
        },
        label = {
            uppercase = true,
            rainbow = {
                enabled = false,
                shade = 5,
            }
        },
    },
    keys = {
        { "<leader>he", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "<leader>ht", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "r",          mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",          mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>",      mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        {
            "gl",
            mode = "n",
            function()
                require("flash").jump({ pattern = "http" })
                vim.cmd("normal gx")
                vim.cmd("normal ``")
            end,
            desc = "Follow link"
        }
    },
}
