-- NOTE: do not forget to move this settigns to dediated file and nake tags?
vim.o.showtabline = 2
vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"

function SetTabName(tab)
    return string.gsub(tab, "%[..%]", "")
end

function GetTabModifiedStatusIcon(tab)
    local wins = require("tabby.module.api").get_tab_wins(tab)
    for i, x in pairs(wins) do
        if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
            return ""
        end
    end
    return "" --""
end

function GetDiagnosticIcon(buf)
    local diagnostics = vim.diagnostic.get(buf)
    local count = { 0, 0, 0, 0 }

    for _, diagnostic in ipairs(diagnostics) do
        count[diagnostic.severity] = count[diagnostic.severity] + 1
    end
    if count[1] > 0 then
        return vim.bo[buf].modified and "" or ""
    elseif count[2] > 0 then
        return vim.bo[buf].modified and "" or ""
    end
    return vim.bo[buf].modified and "" or "" --""
end

local function SetBufferName(buf)
    if string.find(buf, "NvimTree") then
        return "NvimTree"
    end
    return buf
end

-- FIXME: Do not know wy, but the shit does not work with custom highlights
-- vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#e0def4", bg = "#191724" })
-- vim.api.nvim_set_hl(0, "TabLineIn", { bg = "#26233a" })
-- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#1f1d2e" })
-- vim.api.nvim_set_hl(0, "TabLine", { fg = "#908caa", bg = "#403d52" })


local theme = {
    fill = 'TabLineFill',
    -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
    head = 'TabLine',
    current_tab = 'TabLineSel',
    inactive_tab = 'TabLine',
    tab = 'TabLine',
    win = 'TabLine',
    tail = 'TabLine',
}

return {
    "nanozuki/tabby.nvim",
    event = "VimEnter",
    -- lazy = true,
    -- priority = 1001,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require('tabby.tabline').set(function(line)
            return {
                {
                    -- { '  ', hl = theme.head },   
                    -- line.sep('', theme.head, theme.fill),
                },
                line.tabs().foreach(function(tab)
                    local hl = tab.is_current() and theme.current_tab or theme.inactive_tab
                    return {
                        line.sep('', hl, theme.fill),
                        tab.number(),
                        -- "",
                        -- SetTabName(tab.name()),
                        -- "",
                        GetTabModifiedStatusIcon(tab.id),
                        line.sep('', hl, theme.fill),
                        hl = hl,
                        margin = ' ',
                    }
                end),
                line.spacer(),
                line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                    local hl = win.is_current() and theme.current_tab or theme.inactive_tab
                    return {
                        line.sep('', hl, theme.fill),
                        -- win.file_icon(),
                        -- "",
                        SetBufferName(win.buf_name()),
                        -- "",
                        GetDiagnosticIcon(win.buf().id),
                        line.sep('', hl, theme.fill),
                        hl = hl,
                        margin = ' ',
                    }
                end),
                {
                    -- line.sep('', theme.tail, theme.fill),
                    -- { '  ', hl = theme.tail },
                },
                hl = theme.fill,
            }
        end, { theme = theme })

        -- require('tabby.tabline').use_preset('active_wins_at_tail', {
        --     theme = {
        --         fill = 'TabLineFill',       -- tabline background
        --         head = 'TabLine',           -- head element highlight
        --         current_tab = 'TabLineSel', -- current tab label highlight
        --         tab = 'TabLine',            -- other tab label highlight
        --         win = 'TabLine',            -- window highlight
        --         tail = 'TabLine',           -- tail element highlight
        --     },
        --     nerdfont = true,                -- whether use nerdfont
        --     lualine_theme = "auto",         -- lualine theme name
        --     tab_name = {
        --         name_fallback = function(tabid)
        --             return tabid
        --         end,
        --     },
        --     buf_name = {
        --         mode = "tail" -- 'unique'|'relative'|'tail'|'shorten',
        --     },
        --
        -- })

        _G.mod_hl_by_opts("TabLineSel", { fg = _G.get_current_colors().text })

        _G.nmap("<leader>ta", ":$tabnew<CR>", { desc = "Create new tab" })
        _G.nmap("<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
        _G.nmap("<leader>ta", ":tabonly<CR>", { desc = "Close all tabs but current" })
        _G.nmap("<leader>tn", ":tabn<CR>", { desc = "Next tab" })
        _G.nmap("<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

        _G.nmap("tmp", ":-tabmove<CR>", { desc = "Move current tab to previous position" })
        _G.nmap("tmn", ":+tabmove<CR>", { desc = "Move current tab to next position" })
    end
}
