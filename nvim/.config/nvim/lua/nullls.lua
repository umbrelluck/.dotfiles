local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.code_actions.shellcheck,
    },
})
