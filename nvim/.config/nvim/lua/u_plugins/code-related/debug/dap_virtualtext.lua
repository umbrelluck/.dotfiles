-----------------------------------------------------------
-- Plugin for showing debug text in code
-----------------------------------------------------------

local status_ok, dvtext = pcall(require, 'nvim-dap-virtual-text')
if not status_ok then
    return
end

dvtext.setup({})
