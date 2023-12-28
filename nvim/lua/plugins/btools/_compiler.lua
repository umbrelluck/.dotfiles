return {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    keys = {
        { '<F6>',   "<cmd>CompilerOpen<cr>",          desc = "Open Comiler" },
        {
            '<S-F6>',
            "<cmd>CompilerStop<cr>"     -- (Optional, to dispose all tasks before redo)
            .. "<cmd>CompilerRedo<cr>",
            desc = "Stop Compiler and redo last operation"
        },
        { '<S-F7>', "<cmd>CompilerToggleResults<cr>", desc = "Toggle compiler results" }
    },
    opts = {},
}
