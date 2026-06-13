-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
local M = {}

M.setup = function()
    hl.on("hyprland.start", function () 
        hl.exec_cmd("systemctl --user start dunst.service")
        hl.exec_cmd("systemctl --user start waybar.service")

        hl.exec_cmd("systemctl --user start udiskie.service")
        hl.exec_cmd("systemctl --user start copyq.service")

        hl.exec_cmd("systemctl --user start hypridle.service")
        hl.exec_cmd("systemctl --user start hyprlock.service")
        hl.exec_cmd("systemctl --user start hyprpaper.service")
        hl.exec_cmd("systemctl --user start hyprsunset.service")
        hl.exec_cmd("systemctl --user start hyprpolkitagent.service")
    end)
end

return M

-- wpaperd
