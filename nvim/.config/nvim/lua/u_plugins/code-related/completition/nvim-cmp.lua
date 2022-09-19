-----------------------------------------------------------
-- Plugin for autocompletition
-----------------------------------------------------------

local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
    return
end

local c_snippet, c_mapping, c_formatting = {}, {}, {}
local c_comparators = {
    cmp.config.compare.offset,
    cmp.config.compare.exact,
    cmp.config.compare.recently_used,
    cmp.config.compare.kind,
    cmp.config.compare.sort_text,
    cmp.config.compare.length,
    cmp.config.compare.order,
}

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


local luasnip
status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then
    return
end
-- adding new snippets from friendly-snippets
-- luasnip.filetype_extend("ruby", {"rails"}) --if required specifically
require("luasnip.loaders.from_vscode").lazy_load()

c_snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end,
}
c_mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
            -- elseif check_backspace() then
            --     fallback()
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
            -- elseif check_backspace() then
            --     fallback()
        else
            fallback()
        end
    end, { 'i', 's' }),
    -- ['A-x'] = cmp.mapping.close()
})

local lspkind
status_ok, lspkind = pcall(require, 'lspkind')
if status_ok then
    c_formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            preset = 'default',
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                return vim_item
            end
        })
    }
end

local clangd_scores
status_ok, clangd_scores = pcall(require, 'clangd_extensions.cmp_scores')
if status_ok then
    table.insert(c_comparators, 4, clangd_scores)
end


-- nvim-cmp setup
cmp.setup({
    snippet = c_snippet,
    mapping = c_mapping,
    -- setting all other cmp-<something> plugins
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' }, -- provides completition vor LSP runtime API sush as vim.lsp.*
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
    },

    -- setting lspkind code-completion pictures like vs-code
    formatting = c_formatting,

    sorting = {
        comparators = c_comparators,
    },

    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end
})

-- cmp.setup.cmdline(':', {
--     sources = {
--         { name = 'cmdline' }
--     }
-- })

-- cmp.setup.cmdline('/', {
--     sources = {
--         { name = 'buffer' }
--     }
-- })

local cmp_autopairs
status_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if status_ok then
    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )
end
