---------------
---- INPUT ----
---------------

local inputs = {}

inputs.setup = function()
    hl.config({
        input = {
            kb_layout = "us,ua",
            kb_variant = "",
            kb_model = "",
            kb_options = "grp:win_space_toggle, fkeys:basic_13-24",
            kb_rules = "",
            numlock_by_default = true,

            follow_mouse = 1,

            sensitivity = 0.5,

            touchpad = {
                natural_scroll = true,
                scroll_factor = 0.7,
            },
        },
    })

    hl.gesture({
        fingers = 3,
        direction = "horizontal",
        action = "workspace",
    })

    -- Example per-device config
    -- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
    hl.device({
        name = "logitech-m185-1",
        sensitivity = -0.1,
        scroll_factor = 1.2,
    })

    hl.device({
        name = "yichip-2.4g-receiver-mouse",
        sensitivity = -0.1,
        scroll_factor = 1.2,
    })
end

return inputs
