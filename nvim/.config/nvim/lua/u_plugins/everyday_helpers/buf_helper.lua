-----------------------------------------------------------
-- Plugin for easy buffer deletion
-----------------------------------------------------------

local status_ok, bfd_helper = pcall(require, "bufdel")
if not status_ok then
    return
end

bfd_helper.setup {
    next = 'cycle', -- or 'alternate'
    quit = false,
}
