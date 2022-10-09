-----------------------------------------------------------
-- Plugin for highly extendable fuzzy finding over files
-----------------------------------------------------------

local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require("telescope.actions")

local c_maps = {}
local trouble
status_ok, trouble = pcall(require, 'trouble.providers.telescope')
if status_ok then
  c_maps = {
    i = { ["<c-t>"] = trouble.open_with_trouble },
    n = { ["<c-t>"] = trouble.open_with_trouble },
  }
end


telescope.setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = c_maps,
  },
  pickers = {
    find_files = {
      find_command = {
        "fd",
        ".",
        "--type",
        "file",
        "--hidden",
        "--strip-cwd-prefix"
        -- "--ignore-file",
        -- ".git/"
      },
      live_grep = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
    },
  },
  extensions = {
  }
})

telescope.load_extension("projects")
telescope.load_extension("file_browser")
