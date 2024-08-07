return {
    {
        "folke/neodev.nvim",
        opts = {}
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
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

            mason_lspconfig.setup({ ensure_installed = { "lua_ls", "clangd", "pyright", "bashls" } })
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
                                    missing_parameters = true, -- missing fields like in treesitter
                                },
                                completion = {
                                    callSnippet = "Replace"
                                },
                                hint = { enable = true },
                            },
                        },
                    })
                end,

                ["bashls"] = function()
                    lspconfig["bashls"].setup({
                        capabilities = capabilities,
                        filetypes = { "sh", "zsh" }
                    })
                end,


                -- ["rust_analyzer"] = function()
                --     lspconfig["rust_analyzer"].setup({
                --         capabilities = capabilities,
                --         -- root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),
                --         -- settings = {
                --         --     ['rust-analyzer'] = {
                --         --         diagnostics = {
                --         --             enable = true,
                --         --         },
                --         --         check = {
                --         --             ignore = { "dead_code" },
                --         --         }
                --         --     }
                --         -- }
                --     })
                -- end

                -- ["clangd"]=function ()
                --     lspconfig["clangd"].setup({
                --         capabilities=capabilities,
                --     })
                -- end
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- lspconfig.setup({
            --     inlay_hints = { enabled = true }
            -- })
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- because mason has older zls
            lspconfig.zls.setup({
                cmd = { "/home/umbrelluck/Git/zls/zig-out/bin/zls" },
                filetypes = { "zig" },
                root_dir = lspconfig.util.root_pattern("build.zig", ".git"),
                capabilities = capabilities,
            })

            lspconfig.gdscript.setup({
                capabilities = capabilities,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true
                        },
                    }
                }
            })

            for type, icon in pairs(_G.LSPDsigns) do
                local hlv_name = "DiagnosticVirtualText" .. type
                local hls_name = "DiagnosticSign" .. type
                local diag_name = "DiagnosticUnderline" .. type
                -- vim.api.nvim_set_hl(0, hlv, { italic = true })
                _G.mod_hl_by_opts(hlv_name, { italic = true, bg = "" })
                vim.fn.sign_define(hls_name, { text = icon, texthl = hls_name, numhl = hls_name })
                vim.cmd("highlight " .. diag_name .. " gui=underline")
            end

            vim.diagnostic.config({
                underline = true,
                virtual_text = {
                    prefix = _G.LSPDsigns.Dprefix,
                    -- severity = vim.diagnostic.severity.ERROR,
                    format = function(diagnostic)
                        if diagnostic.severity == vim.diagnostic.severity.ERROR then
                            return diagnostic.message
                        end
                        return ""
                    end,
                },
                severity_sort = true,
            })

            _G.nmap("<Leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
            _G.nmap("[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
            _G.nmap("]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
            _G.nmap("<a-F>", "gg=G<c-o>", { noremap = false, desc = "Format current buffer" })
            _G.nmap("<Leader>dq", vim.diagnostic.setqflist, { desc = "Open diagnostics list in quickfix" })
            _G.nmap("<Leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list in loclist" })
            -- _G.nmap("<Leader>do", ":Telescope diagnostics", { desc = "Open diagnostics list in Telescope" })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format() ]])

                    local client = vim.lsp.get_client_by_id(ev.data.client_id)

                    -- INFO: breadcrumbs attachment is handled by breadcrumbs themselves
                    -- if client.server_capabilities.documentSymbolProvider then
                    --     require("nvim-navic").attach(client, ev.buf)
                    --     require("nvim-navbuddy").attach(client, ev.buf)
                    -- end

                    local opts = { buffer = ev.buf }
                    _G.nmap("gD", vim.lsp.buf.declaration, opts)
                    _G.nmap("gd", vim.lsp.buf.definition, opts)
                    _G.nmap("gr", require('telescope.builtin').lsp_references, opts)
                    _G.nmap("K", vim.lsp.buf.hover, opts)
                    _G.nmap("<leader>k", vim.lsp.buf.hover, opts)
                    _G.nmap("<leader>ds", require('telescope.builtin').lsp_document_symbols, opts)
                    _G.nmap("<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)
                    _G.nmap("gi", vim.lsp.buf.implementation, opts)
                    _G.nmap("<Leader>ss", vim.lsp.buf.signature_help, opts)
                    _G.nmap("gk", vim.lsp.buf.signature_help, opts)
                    _G.map({ "n", "i" }, "<a-u>", vim.lsp.buf.signature_help, opts)
                    _G.nmap("<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    _G.nmap("<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    _G.nmap("<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    _G.nmap("<space>D", vim.lsp.buf.type_definition, opts)
                    _G.nmap("<space>rn", vim.lsp.buf.rename, opts)
                    _G.nmap("<space>rr", vim.lsp.buf.references, opts)
                    _G.map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)

                    --[[ if (client.server_capabilities.inlayHintProvider) then
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                    end ]]

                    if (client.supports_method("textDocument/formatting")) then
                        _G.map({ "n", "i" }, "<a-F>", function()
                            vim.lsp.buf.format({ async = true })
                        end, opts)
                    end

                    if (client.name == "gdscript") then
                        -- local pipe = "/tmp/godot.pipe"
                        -- if (vim.fn.filereadable(pipe)) then
                        --     vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
                        -- else
                        --     vim.cmd('echo "WARNING! Pipe "' .. pipe .. '"does not exist!"')
                        -- end
                        _G.map({ "n", "i" }, "<a-F>", function()
                            vim.cmd("!gdformat %")
                        end, opts)
                    end
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
        -- this is help for variables when typing function
        "ray-x/lsp_signature.nvim",
        -- event = { "InsertEnter" },
        opts = {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            floating_window = false,
            handler_opts = {
                border = "rounded"
            },
            hint_enable = false,
            hint_prefix = "",
            toggle_key = "<a-m>",
            select_signature_key = "<a-n>",
        },
    },
    {
        -- INFO: this is apperently null-ls replacement
        "nvimdev/guard.nvim",
        enabled = false,
        dependencies = {
            "nvimdev/guard-collection",
        },
        opts = {
            fmt_on_save = true,
            lsp_as_default_formatter = true,
        },
        config = function(_, opts)
            local ft = require("guard.filetype")

            ft("gdscript")
                :fmt({
                    cmd = "gdformat",
                    stdin = true
                })
                :lint({
                    cmd = "gdlint"
                })

            require("guard").setup(opts)
        end
    }
}
