return {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    event = "VeryLazy",
    dependencies = { "stevearc/overseer.nvim" },
    keys = {
        { '<F6>', "<cmd>CompilerOpen<cr>",          desc = "Open Compiler" },
        {
            '<S-F6>',
            "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
            .. "<cmd>CompilerRedo<cr>",
            desc = "Stop Compiler and redo last operation"
        },
        { '<F7>', "<cmd>CompilerToggleResults<cr>", desc = "Toggle compiler results" }
    },
    opts = {},
}
