local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end


treesitter.setup({
	ensure_installed = { "vimdoc", "c", "lua", "bash" },

	sync_install = false,

	auto_install = true,

	ignore_install = {},

	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		additional_vim_regex_highlighting = false,
	},
})
