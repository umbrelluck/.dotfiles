return {
    { "folke/neodev.nvim", opts = {} },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
            ui = {
                border = "rounded"
            }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            mason_lspconfig.setup({ ensure_installed = { "lua_ls" } })
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    lspconfig["lua_ls"].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    -- Get the language server to recognize the `vim` global
                                    globals = { "vim" },
                                },
                                completion = {
                                    callSnippet = "Replace"
                                },
                            },
                        },
                    })
                end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            _G.map(_G.mods.n, "<space>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
            _G.map(_G.mods.n, "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
            _G.map(_G.mods.n, "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
            _G.map(_G.mods.n, "<a-f>", "gg=G<c-o>", { noremap = false, desc = "Format current buffer" })
            _G.map(_G.mods.n, "<space>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

            for type, icon in pairs(_G.LSPDsigns) do
                local hlv = "DiagnosticVirtualText" .. type
                local hls = "DiagnosticSign" .. type
                vim.api.nvim_set_hl(0, hlv, { italic = true })
                vim.fn.sign_define(hls, { text = icon, texthl = hls, numhl = "" })
            end

            vim.diagnostic.config({
                virtual_text = {
                    prefix = _G.LSPDsigns.Dprefix,
                    -- update_in_insert=false,
                    -- suffix = function(diagnostic)
                    --     return string.format("   [%s]", diagnostic.code)
                    -- end
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    if client.server_capabilities.documentSymbolProvider then
                        require("nvim-navic").attach(client, ev.buf)
                        require("nvim-navbuddy").attach(client, ev.buf)
                    end

                    local opts = { buffer = ev.buf }
                    _G.map(_G.mods.n, "gD", vim.lsp.buf.declaration, opts)
                    _G.map(_G.mods.n, "gd", vim.lsp.buf.definition, opts)
                    _G.map(_G.mods.n, "gr", require('telescope.builtin').lsp_references, opts)
                    _G.map(_G.mods.n, "K", vim.lsp.buf.hover, opts)
                    -- _G.map(_G.mods.n, "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
                    _G.map(_G.mods.n, "<leader>ds", require('telescope.builtin').lsp_document_symbols, opts)
                    _G.map(_G.mods.n, "<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)
                    _G.map(_G.mods.n, "gi", vim.lsp.buf.implementation, opts)
                    _G.map(_G.mods.n, "gk", vim.lsp.buf.signature_help, opts)
                    _G.map({ _G.mods.n, "i" }, "<a-u>", vim.lsp.buf.signature_help, opts)
                    _G.map(_G.mods.n, "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    _G.map(_G.mods.n, "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    _G.map(_G.mods.n, "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    _G.map(_G.mods.n, "<space>D", vim.lsp.buf.type_definition, opts)
                    _G.map(_G.mods.n, "<space>rn", vim.lsp.buf.rename, opts)
                    _G.map(_G.mods.n, "<space>rr", vim.lsp.buf.references, opts)
                    _G.map({ _G.mods.n, "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                    _G.map({ _G.mods.n, "i" }, "<a-f>", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })

            local _border = "rounded"
            local _hgroup = "FloatBorder"
            -- local _border = {
            --     { "╭", _hgroup },
            --     { "─", _hgroup },
            --     { "╮", _hgroup },
            --     { "│", _hgroup },
            --     { "╯", _hgroup },
            --     { "─", _hgroup },
            --     { "╰", _hgroup },
            --     { "│", _hgroup },
            -- }

            require('lspconfig.ui.windows').default_options = {
                border = _border }
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = _border })
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = _border })
            vim.diagnostic.config {
                float = { border = _border } }

            vim.o.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = { "InsertEnter" },
        opts = {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            floating_window = false,
            handler_opts = {
                border = "rounded"
            },
            hint_enable = false,
            hint_prefix = "",
            toggle_key = "<a-x>",
            select_signature_key = "<a-n>",
        },
    }
}
