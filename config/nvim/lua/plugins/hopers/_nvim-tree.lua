return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    -- enabled = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        view = {
            centralize_selection = true,
            cursorline = true,
            debounce_delay = 15,
            side = "left",
            preserve_window_proportions = false,
            number = true,
            relativenumber = true,
            signcolumn = "yes",
            width = 35,
        },
        diagnostics = {
            enable = true,
            show_on_dirs = false,
            show_on_open_dirs = true,
            debounce_delay = 50,
            severity = {
                min = vim.diagnostic.severity.HINT,
                max = vim.diagnostic.severity.ERROR,
            },
        },
        git = {
            enable = false,
        },
        modified = {
            enable = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
        },
        ui = {
            confirm = {
                remove = true,
                trash = true,
                default_yes = true,
            },
        },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        _G.nmap("<Leader>fl", ":NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
        _G.nmap("<Leader>fo", ":NvimTreeFocus<cr>", { desc = "Focus NvimTree" })
        _G.nmap("<Leader>ff", ":NvimTreeFindFile<cr>", { desc = "Find current file NvimTree" })
        _G.nmap("<Leader>fk", ":NvimTreeCollapse<cr>", { desc = "NvimTree Collapse" })
    end,
}
