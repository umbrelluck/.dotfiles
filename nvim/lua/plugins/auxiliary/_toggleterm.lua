return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]],
            direction = 'horizontal', -- can be vertical, horizontal, window, float
            start_in_insert = true,
            insert_mappings = true,   -- whether or not the open mapping applies in insert mode
            terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
            persist_size = true,
            persist_mode = false,     -- if set to true (default) the previous terminal mode will be remembered
            close_on_exit = true,
            shell = zsh,
            winbar = {
                enabled = false,
                name_formatter = function(term) --  term: Terminal
                    return term.name
                end
            },
        }
    }
}
