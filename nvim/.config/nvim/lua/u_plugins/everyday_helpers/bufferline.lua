-----------------------------------------------------------
-- Plugin for buffer tabs
-----------------------------------------------------------

local status_ok, buffer = pcall(require, 'bufferline')
if not status_ok then
    return
end

local bufdel
local close_fun = function() return "bdelete! %d" end
status_ok, bufdel = pcall(require, 'bufdel')
if status_ok then
    close_fun = function(bufnum)
        bufdel.delete_buffer(bufnum, '<bang>' == '!')
    end
end

buffer.setup({
    options = {
        sort_by = 'extension',
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_tab_indicators = true,

        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
            },
        },

        numbers = function(opts)
            return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
        end,

        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,

        close_command = close_fun
    },
})
