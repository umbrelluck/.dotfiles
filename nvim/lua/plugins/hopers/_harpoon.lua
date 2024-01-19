return { {
    "ThePrimeagen/harpoon",
    keys = {
        "<leader>v", "<a-e>", "<leader>1", "<leader>2", "<leader>3", "<leader>4", "<leader>5", "<leader>6", "<leader>7"
    },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        _G.nmap("<leader>v", mark.add_file, { desc = "Add buffer to harpoon ([V]isit)" })
        _G.nmap("<a-e>", ui.toggle_quick_menu, { desc = "View added buffers in harpoon" })
        _G.nmap("<leader>1", function()
            ui.nav_file(1)
        end, { desc = "Open first file in harpoon" })
        _G.nmap("<leader>2", function()
            ui.nav_file(2)
        end, { desc = "Open second file in harpoon" })
        _G.nmap("<leader>3", function()
            ui.nav_file(3)
        end, { desc = "Open third file in harpoon" })
        _G.nmap("<leader>4", function()
            ui.nav_file(4)
        end, { desc = "Open fourth file in harpoon" })
        _G.nmap("<leader>5", function()
            ui.nav_file(5)
        end, { desc = "Open fifth file in harpoon" })
        _G.nmap("<leader>6", function()
            ui.nav_file(6)
        end, { desc = "Open sixth file in harpoon" })
        _G.nmap("<leader>7", function()
            ui.nav_file(7)
        end, { desc = "Open seventh file in harpoon" })
    end,
} }
