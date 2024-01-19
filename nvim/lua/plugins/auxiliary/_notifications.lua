return {
    {
        "rcarriga/nvim-notify",
        enabled = false,
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
            -- vim.cmd([[highlight NotifyERRORBorder guifg=#8A1F1F]])
            -- vim.cmd([[highlight NotifyWARNBorder guifg=#79491D]])
            -- vim.cmd([[highlight NotifyINFOBorder guifg=#4F6752]])
            -- vim.cmd([[highlight NotifyDEBUGBorder guifg=#8B8B8B]])
            -- vim.cmd([[highlight NotifyTRACEBorder guifg=#4F3552]])
            -- vim.cmd([[highlight NotifyERRORIcon guifg=#F70067]])
            -- vim.cmd([[highlight NotifyWARNIcon guifg=#F79000]])
            -- vim.cmd([[highlight NotifyINFOIcon guifg=#A9FF68]])
            -- vim.cmd([[highlight NotifyDEBUGIcon guifg=#8B8B8B]])
            -- vim.cmd([[highlight NotifyTRACEIcon guifg=#D484FF]])
            -- vim.cmd([[highlight NotifyERRORTitle  guifg=#F70067]])
            -- vim.cmd([[highlight NotifyWARNTitle guifg=#F79000]])
            -- vim.cmd([[highlight NotifyINFOTitle guifg=#A9FF68]])
            -- vim.cmd([[highlight NotifyDEBUGTitle  guifg=#8B8B8B]])
            -- vim.cmd([[highlight NotifyTRACETitle  guifg=#D484FF]])
            -- vim.cmd([[highlight link NotifyERRORBody Normal]])
            -- vim.cmd([[highlight link NotifyWARNBody Normal]])
            -- vim.cmd([[highlight link NotifyINFOBody Normal]])
            -- vim.cmd([[highlight link NotifyDEBUGBody Normal]])
            -- vim.cmd([[highlight link NotifyTRACEBody Normal]])

            vim.notify = require("notify")
            require("notify").setup(opts)

            _G.nmap("ZN", function()
                require("notify").dismiss({ silent = true, pending = true })
            end, { desc = "Delete all notifications" })

            require("telescope").load_extension("notify")
            _G.nmap("<leader>sn", ":Telescope notify<cr>", { desc = "[S]earch [N]otifications" })

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
        -- BUG: apparently somehow fucks up nvim -d mode
        "mrded/nvim-lsp-notify",
        dependencies = { "rcarriga/nvim-notify" },
        enabled = false,
        config = function()
            require("lsp-notify").setup({
                -- notify = require("notify")
            })
        end
    },
    {
        "vigoux/notifier.nvim",
        opts = {
            ignore_messages = {}, -- Ignore message from LSP servers with this name
            -- status_width = something, -- COmputed using 'columns' and 'textwidth'
            components = {        -- Order of the components to draw from top to bottom (first nvim notifications, then lsp)
                "nvim",           -- Nvim notifications (vim.notify and such)
                -- "lsp"       -- LSP status updates
            },
            notify = {
                clear_time = 5000,               -- Time in milliseconds before removing a vim.notify notification, 0 to make them sticky
                min_level = vim.log.levels.INFO, -- Minimum log level to print the notification
            },
            component_name_recall = false,       -- Whether to prefix the title of the notification by the component name
            zindex = 50,                         -- The zindex to use for the floating window. Note that changing this value may cause visual bugs with other windows overlapping the notifier window.
        },
        config = function(_, opts)
            require("notifier").setup(opts)

            _G.nmap("<Leader>nc", ":NotifierClear<cr>", { desc = "Clear notifications" })
            _G.nmap("<Leader>nr", ":NotifierReplay<cr>", { desc = "Replay notifications" })
            _G.nmap("<Leader>nq", ":NotifierReplay!<cr>", { desc = "Send notifications to quickfix" })
        end
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        opts = {}
    },
}
