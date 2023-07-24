return {
    {
        "rcarriga/nvim-notify",
        dependencies = { "nvim-telescope/telescope.nvim" },
        opts = {
            background_colour = "#282C34", --onedark grey background
            -- background_colour = "#00000000",
            render = "compact",
            top_down = false,
            stages = "fade",
            timeout = 750,
        },

        config = function(_, opts)
            vim.cmd([[highlight NotifyERRORBorder guifg=#8A1F1F]])
            vim.cmd([[highlight NotifyWARNBorder guifg=#79491D]])
            vim.cmd([[highlight NotifyINFOBorder guifg=#4F6752]])
            vim.cmd([[highlight NotifyDEBUGBorder guifg=#8B8B8B]])
            vim.cmd([[highlight NotifyTRACEBorder guifg=#4F3552]])
            vim.cmd([[highlight NotifyERRORIcon guifg=#F70067]])
            vim.cmd([[highlight NotifyWARNIcon guifg=#F79000]])
            vim.cmd([[highlight NotifyINFOIcon guifg=#A9FF68]])
            vim.cmd([[highlight NotifyDEBUGIcon guifg=#8B8B8B]])
            vim.cmd([[highlight NotifyTRACEIcon guifg=#D484FF]])
            vim.cmd([[highlight NotifyERRORTitle  guifg=#F70067]])
            vim.cmd([[highlight NotifyWARNTitle guifg=#F79000]])
            vim.cmd([[highlight NotifyINFOTitle guifg=#A9FF68]])
            vim.cmd([[highlight NotifyDEBUGTitle  guifg=#8B8B8B]])
            vim.cmd([[highlight NotifyTRACETitle  guifg=#D484FF]])
            vim.cmd([[highlight link NotifyERRORBody Normal]])
            vim.cmd([[highlight link NotifyWARNBody Normal]])
            vim.cmd([[highlight link NotifyINFOBody Normal]])
            vim.cmd([[highlight link NotifyDEBUGBody Normal]])
            vim.cmd([[highlight link NotifyTRACEBody Normal]])

            vim.notify = require("notify")
            require("notify").setup(opts)
            _G.map("n", "Z", function()
                require("notify").dismiss({ silent = true, pending = true })
            end, { desc = "Delete all notifications" })
            _G.map("n", "zz", ":Notifications<cr>", { desc = "View all notifications" })
            _G.map("n", "zt", ":Telescope notify<cr>", { desc = "View all notifications" })
            -- local client_notifs = {}
            --
            -- local function get_notif_data(client_id, token)
            --     if not client_notifs[client_id] then
            --         client_notifs[client_id] = {}
            --     end
            --
            --     if not client_notifs[client_id][token] then
            --         client_notifs[client_id][token] = {}
            --     end
            --
            --     return client_notifs[client_id][token]
            -- end
            --
            --
            -- local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
            --
            -- local function update_spinner(client_id, token)
            --     local notif_data = get_notif_data(client_id, token)
            --
            --     if notif_data.spinner then
            --         local new_spinner = (notif_data.spinner + 1) % #spinner_frames
            --         notif_data.spinner = new_spinner
            --
            --         notif_data.notification = vim.notify(nil, nil, {
            --             hide_from_history = true,
            --             icon = spinner_frames[new_spinner],
            --             replace = notif_data.notification,
            --         })
            --
            --         vim.defer_fn(function()
            --             update_spinner(client_id, token)
            --         end, 100)
            --     end
            -- end
            --
            -- local function format_title(title, client_name)
            --     return client_name .. (#title > 0 and ": " .. title or "")
            -- end
            --
            -- local function format_message(message, percentage)
            --     return (percentage and percentage .. "%\t" or "") .. (message or "")
            -- end
            --
            --
            -- vim.lsp.handlers["$/progress"] = function(_, result, ctx)
            --     local client_id = ctx.client_id
            --
            --     local val = result.value
            --
            --     if not val.kind then
            --         return
            --     end
            --
            --     local notif_data = get_notif_data(client_id, result.token)
            --
            --     if val.kind == "begin" then
            --         local message = format_message(val.message, val.percentage)
            --
            --         notif_data.notification = vim.notify(message, "info", {
            --             title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
            --             icon = spinner_frames[1],
            --             timeout = false,
            --             hide_from_history = false,
            --         })
            --
            --         notif_data.spinner = 1
            --         update_spinner(client_id, result.token)
            --     elseif val.kind == "report" and notif_data then
            --         notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
            --             replace = notif_data.notification,
            --             hide_from_history = false,
            --         })
            --     elseif val.kind == "end" and notif_data then
            --         notif_data.notification =
            --             vim.notify(val.message and format_message(val.message) or "Complete", "info", {
            --                 icon = "",
            --                 replace = notif_data.notification,
            --                 timeout = 3000,
            --             })
            --
            --         notif_data.spinner = nil
            --     end
            -- end
            --
            -- -- table from lsp severity to vim severity.
            -- local severity = {
            --     "error",
            --     "warn",
            --     "info",
            --     "info", -- map both hint and info to info?
            -- }
            -- vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
            --     vim.notify(method.message, severity[params.type])
            -- end
        end,
    },
    {
        "mrded/nvim-lsp-notify",
        -- dependencies = { "rcarriga/nvim-notify" },
        config = function()
            require("lsp-notify").setup({
                -- notify = require("notify")
            })
        end
    }
}
