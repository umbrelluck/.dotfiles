-----------------------------------------------------------
-- Define Reload function
-----------------------------------------------------------

function _G.ReloadConfig()
    for name, _ in pairs(package.loaded) do
        if name:match('^u_plugins') or name:match('^u_essentials') and not name:match('lualine') then
            package.loaded[name] = nil
        end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
