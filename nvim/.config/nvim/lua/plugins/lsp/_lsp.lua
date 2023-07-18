return { {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup({})
    end
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
                            },
                        },
                    })
                end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                {
                    "SmiteshP/nvim-navic",
                    opts = {
                        highlight = true,
                        depth_limit = 5,
                        lsp = { auto_attach = true },
                    },
                },
                "MunifTanjim/nui.nvim",
            },
            opts = { lsp = { auto_attach = true } },
        },
        config = function()
            _G.map("n", "<space>e", vim.diagnostic.open_float)
            _G.map("n", "[d", vim.diagnostic.goto_prev)
            _G.map("n", "]d", vim.diagnostic.goto_next)
            _G.map("n", "<space>q", vim.diagnostic.setloclist)

            _G.map("n", "<C-t>", ':lua require("nvim-navbuddy").open()<cr>')

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

                    -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    -- if client.server_capabilities.documentSymbolProvider then
                    -- 	require("nvim-navic").attach(client, ev.buf)
                    -- 	require("nvim-navbuddy").attach(client, ev.buf)
                    -- end

                    local opts = { buffer = ev.buf }
                    _G.map("n", "gD", vim.lsp.buf.declaration, opts)
                    _G.map("n", "gd", vim.lsp.buf.definition, opts)
                    _G.map("n", "K", vim.lsp.buf.hover, opts)
                    _G.map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
                    _G.map("n", "gi", vim.lsp.buf.implementation, opts)
                    _G.map("n", "gh", vim.lsp.buf.signature_help, opts)
                    _G.map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    _G.map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    _G.map("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    _G.map("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    _G.map("n", "<space>rn", vim.lsp.buf.rename, opts)
                    _G.map("n", "<space>rr", vim.lsp.buf.references, opts)
                    _G.map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                    _G.map("n", "<a-f>", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })

            vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
        end,
    } }
