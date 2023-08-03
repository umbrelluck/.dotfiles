return { {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map(_G.mods.n, "]c", function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            map(_G.mods.n, "[c", function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            -- Actions
            map(_G.mods.n, "<leader>hs", gs.stage_hunk)
            map(_G.mods.n, "<leader>hr", gs.reset_hunk)
            map(_G.mods.v, "<leader>hs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line(_G.mods.v) })
            end)
            map(_G.mods.v, "<leader>hr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line(_G.mods.v) })
            end)
            map(_G.mods.n, "<leader>hS", gs.stage_buffer)
            map(_G.mods.n, "<leader>hu", gs.undo_stage_hunk)
            map(_G.mods.n, "<leader>hR", gs.reset_buffer)
            map(_G.mods.n, "<leader>hp", gs.preview_hunk)
            map(_G.mods.n, "<leader>hb", function()
                gs.blame_line({ full = true })
            end)
            map(_G.mods.n, "<leader>gb", gs.toggle_current_line_blame)
            map(_G.mods.n, "<leader>hd", gs.diffthis)
            map(_G.mods.n, "<leader>hD", function()
                gs.diffthis("~")
            end)
            map(_G.mods.n, "<leader>td", gs.toggle_deleted)

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
    },
} }
