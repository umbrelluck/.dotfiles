-----------------------------------------------------------
-- PLugin for windows management and animation
-----------------------------------------------------------

local status_ok, windows = pcall(require, 'windows')
if not status_ok then
    return
end

windows.setup()
