------------------------
---- Hypr scrolling ----
------------------------

local M = {}
local mainMod = "SUPER"

M.setup = function()
    hl.config({
        scrolling = {
            fullscreen_on_one_column = false,
            follow_min_visible = 1,
            wrap_swapcol = false,
        },
    })

    -- Toggle window size
    hl.bind(mainMod .. " + R", hl.dsp.layout("colresize +conf"))
    hl.bind(mainMod .. " + F", hl.dsp.layout("fit active"))
    hl.bind(mainMod .. " + C", hl.dsp.layout("colresize -conf"))
    -- hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen("maximized", "toggle"))
    hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen("fullscreen", "toggle"))
    -- Window manipulation
    hl.bind(mainMod .. " + period", hl.dsp.layout("consume_or_expel next"))
    hl.bind(mainMod .. " + comma", hl.dsp.layout("consume_or_expel prev"))

    -- move focus with mainmod + arrow keys
    hl.bind(mainMod .. " + CTRL + h", hl.dsp.layout("swapcol l"))
    hl.bind(mainMod .. " + CTRL + l", hl.dsp.layout("swapcol r"))

    hl.bind(mainMod .. " + CTRL + left", hl.dsp.layout("swapcol l"))
    hl.bind(mainMod .. " + CTRL + right", hl.dsp.layout("swapcol r"))

    -- hl.bind(mainMod .. " + H", hl.dsp.layout("focus l"))
    -- hl.bind(mainMod .. " + L", hl.dsp.layout("focus r"))
    -- hl.bind(mainMod .. " + K", hl.dsp.layout("focus u"))
    -- hl.bind(mainMod .. " + J", hl.dsp.layout("focus d"))
end

return M
