local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

null_ls.setup({
    sources = {
        require("null-ls").builtins.formatting.shfmt,
        require("null-ls").builtins.formatting.beautysh,
        require("null-ls").builtins.diagnostics.shellcheck,
        require("null-ls").builtins.code_actions.shellcheck,
    },
})
