-----------------------------------------------------------
-- LSP configurations
-----------------------------------------------------------

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

local vm = vim
local mappings = {
    show_diagnostics = vm.diagnostic.open_float,
    def_dec = "<cmd>lua print('You must have LSPsaga installed to use this.')<CR>",
    code_actions = vm.lsp.buf.code_action,
    definition = vm.lsp.buf.definition,
    declaration = vm.lsp.buf.declaration,
    type_definition = vm.lsp.buf.type_definition,
    implementation = vm.lsp.buf.implementation,
    references = vm.lsp.buf.references,
    dnext = vm.diagnostic.goto_next,
    dprev = vm.diagnostic.goto_prev,
    dnext_er = function() print('You must have LSPsaga installed to use this.') end,
    dprev_er = function() print('You must have LSPsaga installed to use this.') end,
    hover = vm.lsp.buf.hover,
    signature_help = vm.lsp.buf.signature_help,
    rename = vm.lsp.buf.rename,
    outline = "<cmd>lua print('You must have LSPsaga installed to use this.')<CR>",
    formatting = function() vim.lsp.buf.format { async = true } end,
    workspace_a = vim.lsp.buf.add_workspace_folder,
    workspace_d = vim.lsp.buf.remove_workspace_folder,
    workspace_l = function() print(vm.inspect(vm.lsp.buf.list_workspace_folders())) end,
}

local saga
status_ok, saga = pcall(require, 'lspsaga')
if status_ok then

    --[[ saga.init_lsp_saga({
        finder_action_keys = {
            open = "o",
            vsplit = "v",
            split = "h",
            tabe = "t",
            quit = "q",
        },
        code_action_keys = {
            quit = "q",
            exec = "<CR>",
        },
        definition_action_keys = {
            edit = '<C-c>o',
            vsplit = '<C-c>v',
            split = '<C-c>h',
            tabe = '<C-c>t',
            quit = 'q',
        },
        rename_action_quit = "<C-c>",
        rename_in_select = true,
    }) ]]

    mappings["show_diagnostics"] = "<cmd>Lspsaga show_line_diagnostics<CR>"
    mappings["def_dec"] = "<cmd>Lspsaga lsp_finder<CR>"
    mappings["code_actions"] = "<cmd>Lspsaga code_action<CR>"
    mappings["definition"] = "<cmd>Lspsaga peek_definition<CR>"
    mappings["dnext"] = "<cmd>Lspsaga diagnostic_jump_next<CR>"
    mappings["dprev"] = "<cmd>Lspsaga diagnostic_jump_prev<CR>"
    mappings["dnext_er"] = function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end
    mappings["dprev_er"] = function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end
    mappings["hover"] = "<cmd>Lspsaga hover_doc<CR>"
    mappings["rename"] = "<cmd>Lspsaga rename<CR>"
    mappings["outline"] = "<cmd>LSoutlineToggle<CR>"
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = {} 
local cmp_nvim_lsp
status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities()
    -- capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

-- TODO: when 0.8 neovim comes remove this and go for null-ls settings
--[[ local util = require('vim.lsp.util')
local formatting_callback = function(client, bufnr)
    vm.keymap.set('n', '<A-f>', function()
        local params = util.make_formatting_params({})
        client.request('textDocument/formatting', params, nil, bufnr)
    end, { buffer = bufnr })
end ]]

-- apply keybindings only when particular lsp present
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vm.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- NOTE: LSP mappings
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vm.keymap.set('n', '<space>ll', mappings.def_dec, bufopts)
    vm.keymap.set('n', '<space>le', mappings.show_diagnostics, bufopts)
    vm.keymap.set('n', '<space>lD', mappings.declaration, bufopts)
    vm.keymap.set('n', '<space>ld', mappings.definition, bufopts)
    vm.keymap.set('n', '<space>lh', mappings.hover, bufopts)
    vm.keymap.set('n', '<space>li', mappings.implementation, bufopts)
    vm.keymap.set('n', '<space>lH', mappings.signature_help, bufopts)
    vm.keymap.set('n', '<space>lwa', mappings.workspace_a, bufopts)
    vm.keymap.set('n', '<space>lwr', mappings.workspace_d, bufopts)
    vm.keymap.set('n', '<space>lwl', mappings.workspace_l, bufopts)
    vm.keymap.set('n', '<space>ltd', mappings.type_definition, bufopts)
    vm.keymap.set('n', '<space>lr', mappings.rename, bufopts)
    vm.keymap.set('n', '<space>la', mappings.code_actions, bufopts)
    vm.keymap.set('n', '<space>lf', mappings.references, bufopts)
    vm.keymap.set('n', '<A-f>', mappings.formatting, bufopts)
    vm.keymap.set('n', '<space>lo', mappings.outline, bufopts)
    vm.keymap.set('n', ']n', mappings.dnext, bufopts)
    vm.keymap.set('n', '[n', mappings.dprev, bufopts)
    vm.keymap.set('n', ']N', mappings.dnext_er, bufopts)
    vm.keymap.set('n', '[N', mappings.dprev_er, bufopts)


    -- TODO: when 0.8 neovim comes remove this and go for null-ls settings
    -- formatting_callback(client, bufnr)
end

-- Enable language servers
local servers = {}
local mason

-- local parent_folder = (...):match("(.-)[^%.]+$")
local parent_folder = function()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
    -- return str
end

-- print("Debug from mason: path" .. parent_folder())

-- status_ok, mason = pcall(require, parent_folder() .. '.helpers.mason')
status_ok, mason = pcall(require, 'u_plugins.code-related.helpers.mason')
if status_ok then
    servers = mason.SERVERS_TO_INSTALL
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
end

-- Other servers to setup
servers = { "yamlls", "bashls", "marksman" }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

local border_opts = { border = 'rounded', focusable = false, scope = 'line' }
vim.diagnostic.config({ virtual_text = false, float = border_opts })
