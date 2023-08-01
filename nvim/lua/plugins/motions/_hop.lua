return { {
    "phaazon/hop.nvim",
    branch = "v2",
    opts = {
        keys = "etovxqpdygfblzhckisuran",
        current_line_only = false,
    },
    keys = { "f", "F", "t", "T" },
    config = function(_, opts)
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection
        hop.setup(opts)
        _G.map("", "f", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR })
        end, { remap = true })
        _G.map("", "F", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR })
        end, { remap = true })
        _G.map("", "t", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
        end, { remap = true })
        _G.map("", "T", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
        end, { remap = true })
    end
} }
