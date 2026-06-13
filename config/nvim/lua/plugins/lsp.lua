local function get_mini_icon(ctx)
    if ctx.source_name == "Path" then
        local is_unknown_type =
            vim.tbl_contains({ "link", "socket", "fifo", "char", "block", "unknown" }, ctx.item.data.type)
        local mini_icon, mini_hl, _ = require("mini.icons").get(
            is_unknown_type and "os" or ctx.item.data.type,
            is_unknown_type and "" or ctx.label
        )
        if mini_icon then
            return mini_icon, mini_hl
        end
    end

    local mini_icon, mini_hl, _ = require("mini.icons").get("lsp", ctx.kind)
    return mini_icon, mini_hl
end

return {
    --------------------
    ---- LSP config ----
    --------------------
    { "neovim/nvim-lspconfig" },
    -------------------------
    ---- LSP nvim config ----
    -------------------------
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
        },
    },
    ---------------
    ---- Mason ----
    ---------------
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = true,
            ensure_installed = { "lua_ls", "pyright" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            { "neovim/nvim-lspconfig" },
        },
    },
    -----------------------------
    ---- Autopairs & surround----
    -----------------------------
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {
            ignored_next_char = "[%w%.]",
            fast_wrap = {
                map = "<M-r>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = [=[[%'%"%>%]%)%}%,]]=],
                end_key = "$",
                before_key = "h",
                after_key = "l",
                cursor_pos_before = true,
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                manual_position = true,
                -- highlight = "Search",
                -- highlight_grey = "Comment",
            },
        },
    },
    {
        "kylechui/nvim-surround",
        version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        -- config = function()
        --     require("nvim-surround").setup({
        --         -- Put your configuration here
        --     })
        -- end
    },
    ---------------
    ---- Blink ----
    ---------------
    {
        "saghen/blink.cmp",
        dependencies = {
            "saghen/blink.lib",
            "rafamadriz/friendly-snippets",
            "nvim-mini/mini.icons",
            "L3MON4D3/LuaSnip",
        },
        build = function()
            -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
            require("blink.cmp").build():wait(60000)
        end,

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            completion = {
                menu = {
                    border = "rounded",
                    draw = {
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    local kind_icon, kind_hl = get_mini_icon(ctx)
                                    return kind_icon
                                end,
                                highlight = function(ctx)
                                    local _, hl = get_mini_icon(ctx)
                                    return hl
                                end,
                            },
                            kind = {
                                highlight = function(ctx)
                                    local _, hl = get_mini_icon(ctx)
                                    return hl
                                end,
                            },
                        },
                    },
                },
                documentation = {
                    window = { border = "rounded" },
                    auto_show = true,
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true,
                    },
                },
            },
            signature = { window = { border = "rounded" } },
            snippets = { preset = "luasnip" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                providers = {
                    snippets = {
                        should_show_items = function(ctx)
                            return ctx.trigger.initial_kind ~= "trigger_character"
                        end,
                    },
                },
            },
            --            function(ctx)
            --   return ctx.trigger.initial_kind ~= 'trigger_character'
            -- end,
            -- snippets = { preset = "luasnip" },
            keymap = {
                preset = "default",
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

                ["<M-e>"] = {
                    function(cmp)
                        if require("blink.cmp.completion.list").get_selected_item() ~= nil then
                            return cmp.accept()
                        else
                            return cmp.hide()
                        end
                    end,
                    "fallback",
                },

                ["<M-o>"] = {
                    function(cmp)
                        if require("blink.cmp.completion.list").get_selected_item() ~= nil then
                            return cmp.accept()
                        else
                            return cmp.select_and_accept()
                        end
                    end,
                    "fallback",
                },

                ["<CR>"] = {
                    function(cmp)
                        if require("blink.cmp.completion.list").get_selected_item() ~= nil then
                            return cmp.accept({ behavior = "replace" })
                        end
                    end,
                    "fallback",
                },

                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
            },
            cmdline = {
                completion = {
                    list = {
                        selection = {
                            preselect = false,
                            auto_insert = true,
                        },
                    },
                },
                keymap = {
                    preset = "cmdline",
                    ["<CR>"] = {
                        function(cmp)
                            if require("blink.cmp.completion.list").get_selected_item() ~= nil then
                                return cmp.accept_and_enter({ behavior = "replace" })
                            end
                        end,
                        "fallback",
                    },
                },
            },
            fuzzy = { implementation = "rust" },
            appearance = {
                use_nvim_cmp_as_default = true,
            },
        },
    },
}
