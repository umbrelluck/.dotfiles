-----------------------------------------------------------
-- Plugin for command visualization on typing
-----------------------------------------------------------

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end

wk.setup()

--[[ wk.register({
    ["<leader>"] = {
        f = {
            name = "Work with files",
            n = { "<cmd>enew<cr>", "New File" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search for pattern in file" },
            g = { "<cmd>Telescope live_grep<cr>", "Search for pattern in files" },
        },

        t = {
            name = "Work with diagnostic",
            o = { "<cmd>TodoTelescope<cr>", "Toggle Todos" },
            t = { "<cmd>TroubleToggle", "Toggle Trouble window" },
            w = { "<cmd>TroubleToggle workspace_diagnostics", "Workspace diagnostics" },
            f = { "<cmd>TroubleToggle document_diagnostics", "File diagnostics" },
            l = { "<cmd>TroubleToggle loclist", "Show loclist" },
            q = { "<cmd>TroubleToggle quickfix", "Show quickfix" },
        },

        z = { "Oblom" },
    },

    ["<space>"] = {
        a = {
            name = "jhdvbjdvdsbn"
        }
    }
}) ]]
