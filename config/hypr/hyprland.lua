-----------------
---- SOURCES ----
-----------------

-- package.path = package.path .. ";/home/USER/.config/hypr/modules"
-- package.path = package.path .. ";/home/USER/.config/hypr/modules/?.lua"

-- require("modules.variables").setup()
require("modules.autostart").setup()
require("modules.inputs").setup()
require("modules.config").setup()
require("modules.monitors").setup()
require("modules.hyprscroll").setup()
require("modules.keybindings").setup()
require("modules.windowrules").setup()
