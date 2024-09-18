return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_substitute = nil,
        yank_substituted_text = false,
        preserve_cursor_position = false,
        modifiers = nil,
        highlight_substituted_text = {
            enabled = true,
            timer = 500,
        },
        range = {
            prefix = "s",
            prompt_current_text = false,
            confirm = false,
            complete_word = false,
            subject = nil,
            range = nil,
            suffix = "",
            auto_apply = false,
            cursor_position = "end",
        },
        exchange = {
            motion = false,
            use_esc_to_cancel = true,
            preserve_cursor_position = false,
        },
    },
    config = function(_, opts)
        local substitute = require("substitute")
        substitute.setup(opts)

        _G.nmap("s", substitute.operator, { desc = "Substitute with operator" })
        _G.nmap("ss", substitute.line, { desc = "Substitute line" })
        _G.nmap("S", substitute.eol, { desc = "Substitute to end of line" })
        _G.xmap("s", substitute.visual, { desc = "Substitute visual" })
    end
}
