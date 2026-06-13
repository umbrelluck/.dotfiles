-- Open FzfLua results in Trouble
local config = require("fzf-lua.config")
local actions = require("trouble.sources.fzf").actions
config.defaults.actions.files["ctrl-o"] = actions.open

-- notification change
-- vim.notify = require("notify")

-- LSP diagnostic
-- for type, icon in pairs(_G.signs) do
--     local hlv_name = "DiagnosticVirtualText" .. type
--     local hls_name = "DiagnosticSign" .. type
--     local diag_name = "DiagnosticUnderline" .. type
--     -- vim.api.nvim_set_hl(0, hlv, { italic = true })
--     _G.mod_hl_by_opts(hlv_name, { italic = true, bg = "" })
--     vim.fn.sign_define(hls_name, { text = icon, texthl = hls_name, numhl = hls_name })
--     vim.cmd("highlight " .. diag_name .. " gui=underline")
-- end

-- vim.diagnostic.config({
--     underline = true,
--     virtual_text = {
--         prefix = _G.signs.Dprefix,
--         -- severity = vim.diagnostic.severity.ERROR,
--         format = function(diagnostic)
--             if diagnostic.severity == vim.diagnostic.severity.ERROR then
--                 return diagnostic.message
--             end
--             return ""
--         end,
--     },
--     severity_sort = true,
-- })

-- Auto format on save
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if
            not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting")
        then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("my.pretty", {}),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Blink.cmp selection menu highlights
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "BlinkCmpDoc" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "BlinkCmpDocBorder" })
-- vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { link = "BlinkCmpSignatureHelpActiveParameter" })
-- vim.api.nvim_set_hl(0, "BlinkCmpScrollBarGutter", { link = "BlinkCmpDocBorder" })
-- vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { link = "BlinkCmpDocBorder" })

-- To load friendly-snippets with LuaSnip
require("luasnip.loaders.from_vscode").lazy_load()

-- Folke snacks notifications
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params
        .value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then
            return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
            if i == #p + 1 or p[i].token == ev.data.params.token then
                p[i] = {
                    token = ev.data.params.token,
                    msg = ("[%3d%%] %s%s"):format(
                        value.kind == "end" and 100 or value.percentage or 100,
                        value.title or "",
                        value.message and (" **%s**"):format(value.message) or ""
                    ),
                    done = value.kind == "end",
                }
                break
            end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v)
            return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(table.concat(msg, "\n"), "info", {
            id = "lsp_progress",
            title = client.name,
            opts = function(notif)
                notif.icon = #progress[client.id] == 0 and " "
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})

-- -- Snacks rename integration with OIl
-- FIX: apparently not working correctly
-- vim.api.nvim_create_autocmd("User", {
--     pattern = "OilActionsPost",
--     callback = function(event)
--         if event.data.actions[1].type == "move" then
--             Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
--         end
--     end,
-- })

-- .. for newtr
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "netrw" },
    group = vim.api.nvim_create_augroup("NetrwOnRename", { clear = true }),
    callback = function()
        vim.keymap.set("n", "R", function()
            local original_file_path = vim.b.netrw_curdir .. "/" .. vim.fn["netrw#Call"]("NetrwGetWord")

            vim.ui.input({ prompt = "Move/rename to:", default = original_file_path }, function(target_file_path)
                if target_file_path and target_file_path ~= "" then
                    local file_exists = vim.uv.fs_access(target_file_path, "W")

                    if not file_exists then
                        vim.uv.fs_rename(original_file_path, target_file_path)
                        Snacks.rename.on_rename_file(original_file_path, target_file_path)
                    else
                        vim.notify(
                            "File '" .. target_file_path .. "' already exists! Skipping...",
                            vim.log.levels.ERROR
                        )
                    end

                    -- Refresh netrw
                    vim.cmd(":Ex " .. vim.b.netrw_curdir)
                end
            end)
        end, { remap = true, buffer = true })
    end,
})
