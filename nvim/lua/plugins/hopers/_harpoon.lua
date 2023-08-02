return { {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        _G.map("n", "<leader>a", mark.add_file, { desc = "[A] buffer to harpoon" })
        -- _G.map("n", "<C-e>", ui.toggle_quick_menu, {desc="View added buffers in harpoon"})
        _G.map("n", "<a-e>", ui.toggle_quick_menu, { desc = "View added buffers in harpoon" })
        _G.map("n", "<a-v>", ui.toggle_quick_menu, { desc = "[V]iew added buffers in harpoon" })
        _G.map("n", "<leader>1", function()
            ui.nav_file(1)
        end)
        _G.map("n", "<leader>2", function()
            ui.nav_file(2)
        end)
        _G.map("n", "<leader>3", function()
            ui.nav_file(3)
        end)
        _G.map("n", "<leader>4", function()
            ui.nav_file(4)
        end)
    end,
} }
