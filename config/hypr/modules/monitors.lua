------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

local M = {}

M.setup = function()
    hl.monitor({
        output = "",
        mode = "preferred",
        position = "auto",
        scale = 1,
    })
end

return M
