local status_ok, mark = pcall(require, "harpoon.mark")
if not status_ok then
	return
end

local ui = require("harpoon.ui")

_G.map("n", "<leader>a", mark.add_file)
_G.map("n", "<C-e>", ui.toggle_quick_menu)
_G.map("n", "<A-e>", ui.toggle_quick_menu)

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
