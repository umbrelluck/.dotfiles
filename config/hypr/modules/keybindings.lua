---------------------
---- KEYBINDINGS ----
---------------------

local variables = require("modules.variables")

local M = {}
local mainMod = "SUPER"

M.setup = function()
    -- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
    hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(variables.terminal))
    -- local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
    -- closeWindowBind:set_enabled(false)
    hl.bind(mainMod .. " + Q", hl.dsp.window.close())
    hl.bind(mainMod .. " + M", hl.dsp.exec_cmd('loginctl terminate-user ""'))
    -- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
    hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(variables.fileManager))
    hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
    hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd(variables.runner))
    hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("uwla zen-browser"))
    hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
    hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

    -- move focus
    hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
    hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

    hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
    hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

    hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.focus({ direction = "right" }))

    -- move windows
    -- NOTE: some are commented due to config.hyprscroll
    -- hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.move({ direction = "left" }))
    -- hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.move({ direction = "right" }))
    hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.move({ direction = "up" }))
    hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.move({ direction = "down" }))

    -- hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.move({ direction = "left" }))
    -- hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "right" }))
    hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.move({ direction = "up" }))
    hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.move({ direction = "down" }))

    -- Switch workspaces with mainMod + [0-9]
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    for i = 1, 10 do
        local key = i % 10 -- 10 maps to key 0
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
        hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
        -- hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    end

    -- Example special workspace (scratchpad)
    hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + CTRL + S", hl.dsp.window.move({ workspace = "special:magic" }))

    -- Scroll through existing workspaces on monitor
    hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "m+1" }))
    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "m-1" }))

    hl.bind(mainMod .. " + U", hl.dsp.focus({ workspace = "m+1" }))
    hl.bind(mainMod .. " + I", hl.dsp.focus({ workspace = "m-1" }))

    hl.bind(mainMod .. " + CTRL + U", hl.dsp.window.move({ workspace = "r+1" }))
    hl.bind(mainMod .. " + CTRL + I", hl.dsp.window.move({ workspace = "r-1" }))

    -- Move/resize windows with mainMod + LMB/RMB and dragging
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Laptop multimedia keys for volume and LCD brightness
    hl.bind(
        "XF86AudioRaiseVolume",
        hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/sound/wpctl-control.sh -u"),
        { locked = true, repeating = true }
    )
    hl.bind(
        "XF86AudioLowerVolume",
        hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/sound/wpctl-control.sh -d"),
        { locked = true, repeating = true }
    )
    hl.bind(
        "XF86AudioMute",
        hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/sound/wpctl-control.sh -t"),
        { locked = true, repeating = true }
    )
    hl.bind(
        "XF86AudioMicMute",
        hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/sound/wpctl-control.sh -s"),
        { locked = true, repeating = true }
    )
    hl.bind(
        "XF86MonBrightnessUp",
        hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/backlight/bright-control.sh -u"),
        { locked = true, repeating = true }
    )
    hl.bind(
        mainMod .. " + SHIFT + M",
        hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/backlight/bright-control.sh -u"),
        { locked = true, repeating = true }
    )
    hl.bind(
        "XF86MonBrightnessDown",
        hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/backlight/bright-control.sh -d"),
        { locked = true, repeating = true }
    )
    hl.bind(
        mainMod .. " + SHIFT + N",
        hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/backlight/bright-control.sh -d"),
        { locked = true, repeating = true }
    )

    -- Requires playerctl
    hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
end

return M
