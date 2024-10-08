return { {
    "smoka7/hop.nvim",
    -- branch = "v2",
    tag = '*',
    opts = {
        keys = "etovxqpdygfblzhckisuran",
        -- current_line_only = false,
    },
    enabled = false,
    cmd = { "HopPatternCurrentLine" },
    keys = { "f", "F", "t", "T", "<Leader>hw", "<Leader>he", "<m-/>", "gl", "gL" },
    config = function(_, opts)
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.setup(opts)

        -- current_line_only = true
        _G.emap("f", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, })
        end, { remap = true, desc = "Remap for f" })
        _G.emap("F", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, })
        end, { remap = true, desc = "Remap for F" })
        _G.emap("t", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end, { remap = true, desc = 'Remap for t' })
        _G.emap("T", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end, { remap = true, desc = "Remap for T" })

        _G.nmap("gl", function()
            hop.hint_patterns({ direction = directions.AFTER_CURSOR, current_line_only = true, }, "http")
            -- vim.cmd("normal! w")
            vim.cmd("normal gx")
            vim.cmd("normal ``")
        end, { desc = "Find nearest url after cursor" })

        _G.nmap("gL", function()
            hop.hint_patterns({ direction = directions.BEFORE_CURSOR, current_line_only = true, }, "http")
            -- vim.cmd("normal! w")
            vim.cmd("normal gx")
            vim.cmd("normal ``")
        end, { desc = "Find nearest url before cursor" })

        _G.nmap("<Leader>hw", ":HopWord<cr>", { desc = "Hop word" })
        _G.nmap("<Leader>he", ":HopPattern<cr>", { desc = "Hop pattern" })
        _G.nmap("<m-/>", ":HopPattern<cr>", { desc = "Hop pattern" })

        _G.nmap("<Leader>hmw", ":HopWordMW<cr>", { desc = "Hop word in multiple wimdows" })
        _G.nmap("<Leader>hme", ":HopPatternMW<cr>", { desc = "Hop pattern in multiple windows" })
    end
} }
