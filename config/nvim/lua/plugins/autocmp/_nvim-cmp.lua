return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            "L3MON4D3/LuaSnip",         -- Snippets plugin
            "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
            "lukas-reineke/cmp-under-comparator",

            "kdheepak/cmp-latex-symbols",
        },
        config = function()
            local luasnip, cmp

            luasnip = require("luasnip")
            cmp = require("cmp")

            local kind_icons = {
                Text = "",
                Method = "",
                Function = "󰊕",
                Constructor = "",
                Field = "",
                Variable = "",
                Class = "",
                Interface = "",
                Module = "",
                Property = "",
                Unit = "",
                Value = "󰎠",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "",
                Event = "",
                Operator = "",
                TypeParameter = "",
            }

            vim.api.nvim_set_hl(0, "CmpItemMenu", { italic = true })

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup({
                -- enabled = function()
                --     local context = require 'cmp.config.context'
                --     if vim.api.nvim_get_mode().mode == 'c' then
                --         return true
                --     else
                --         return not context.in_treesitter_capture("comment")
                --             and not context.in_syntax_group("Comment")
                --     end
                -- end,
                preselect = cmp.PreselectMode.None, --NOTE: fucking rust preselects autocompletions
                completion = {
                    completeopt = vim.o.completeopt --maybe?
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered({
                        -- scrollbar = false,
                        side_padding = 1,
                        col_offset = -3,
                    }),
                    documentation = cmp.config.window.bordered(),
                },
                experimental = { ghost_text = true },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<A-r>"] = cmp.mapping.abort(),
                    ["<c-e>"] = cmp.mapping.abort(),
                    ["<c-c>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() and cmp.get_active_entry() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            else
                                fallback()
                            end
                        end,
                        s = cmp.mapping.confirm({ select = true }),
                        -- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }),
                    ["<m-o>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() then
                                local entry = cmp.get_selected_entry()
                                if not entry then
                                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                                end
                                -- cmp.confirm()
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
                            end
                        end,
                        s = cmp.mapping.confirm({ select = true }),
                        -- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }),
                    ["<m-e>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() and cmp.get_active_entry() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
                            else
                                fallback()
                            end
                        end,
                        s = cmp.mapping.confirm({ select = true }),
                        -- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- they way you will only jump inside the snippet region
                            -- elseif luasnip.expand_or_locally_jumpable() then
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Up
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),  -- Down
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Down
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                    -- {
                    --     name = "latex_symbols",
                    --     option = {
                    --         strategy = 0, -- mixed
                    --     },
                    -- },
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    expandable_indicator = true,
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = vim_item.kind
                        vim_item.kind = kind_icons[kind]
                        local source = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[LaTeX]",
                            cmdline = "[CMD]",
                            path = "[Path]"
                        })[entry.source.name]
                        vim_item.menu = "  " .. (source or "[?]")
                        vim_item.abbr = vim_item.abbr:match("[^(]+")
                        return vim_item
                    end,
                },
                sorting = {
                    priority_weight = 1,
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        require "cmp-under-comparator".under,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                        -- cmp.config.compare.recently_used,
                        -- cmp.config.compare.locality,
                    },
                }
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    }
}
