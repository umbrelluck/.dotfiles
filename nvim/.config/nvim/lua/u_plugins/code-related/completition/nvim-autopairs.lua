-----------------------------------------------------------
-- Plugin for autopairs creation
-----------------------------------------------------------

local status_ok, atp = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

atp.setup({
  enable_check_bracket_line = false,
  ignored_next_char = "[%w%.%<%>]",
  check_ts = true,

  fast_wrap = {},
})
