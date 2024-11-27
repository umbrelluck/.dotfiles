return {
    "uga-rosa/ccc.nvim",
    -- event = "VeryLazy",
    cmd = { "CccPick",
        "CccHighlighterEnable",
        "CccHighlighterDisable",
        "CccHighlighterToggle"
    },
    keys = {
        { "<leader>ci", "<cmd>CccPick<cr>",              desc = "[C]olor P[i]cker" },
        { "<leader>co", "<cmd>CccHighlighterToggle<cr>", desc = "[C]olor Picker T[o]ggle" }
    },
    opts = {
        highlighter = {
            auto_enable = false,
            lsp = true,
        },
        highlight_mode = "virtual",
        virtual_pos = "inline-right"
    }
}

-- local ccc = require("ccc")
-- local mapping = ccc.mapping
--
-- d Default mapping: h / s / m (1 / 5 / 10)
-- i Default mapping: l / d / , (1 / 5 / 10)
