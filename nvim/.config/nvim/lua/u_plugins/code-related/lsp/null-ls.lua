-----------------------------------------------------------
-- Plugins for non-LSPs support
-----------------------------------------------------------

local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

local helpers = require("null-ls.helpers")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- TODO: when 0.8 neovim comes, change back to this

-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.format({
--         filter = function(client)
--             -- apply whatever logic you want (in this example, we'll only use null-ls)
--             return client.name == "null-ls"
--         end,
--         bufnr = bufnr,
--     })
-- end

local sources = {
    -- null_ls.builtins.code_actions.gitrebase,
    null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.code_actions.proselint,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.formatting.shfmt,


    -- null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.completion.luasnip,

    -- null_ls.builtins.diagnostics.cppcheck,

    null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.formatting.autopep8,
}

local markdownlint = {
    method = null_ls.methods.DIAGNOSTICS,
    filetypes = { "markdown" },
    -- null_ls.generator creates an async source
    -- that spawns the command with the given arguments and options
    generator = null_ls.generator({
        command = "markdownlint",
        args = { "--stdin" },
        to_stdin = true,
        from_stderr = true,
        -- choose an output format (raw, json, or line)
        format = "line",
        check_exit_code = function(code, stderr)
            local success = code <= 1

            if not success then
                -- can be noisy for things that run often (e.g. diagnostics), but can
                -- be useful for things that run on demand (e.g. formatting)
                print(stderr)
            end

            return success
        end,
        -- use helpers to parse the output from string matchers,
        -- or parse it manually with a function
        on_output = helpers.diagnostics.from_patterns({
            {
                pattern = [[:(%d+):(%d+) [%w-/]+ (.*)]],
                groups = { "row", "col", "message" },
            },
            {
                pattern = [[:(%d+) [%w-/]+ (.*)]],
                groups = { "row", "message" },
            },
        }),
    }),
}

null_ls.setup({
    sources = sources,

    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- vim.lsp.buf.formatting_sync()
                    vim.lsp.buf.formatting({ bufnr = bufnr })
                    -- TODO 0.8
                    -- lsp_formatting(bufnr)
                end,
            })
        end
    end,
})

null_ls.register(markdownlint)
