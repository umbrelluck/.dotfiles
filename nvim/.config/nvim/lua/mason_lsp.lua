local status_ok, mason, mason_lspconf, lspconfig, capabilities

status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup({})

status_ok, mason_lspconf = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

status_ok, capabilities = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

capabilities = capabilities.default_capabilities()

mason_lspconf.setup({
	ensure_installed = { "lua_ls" },
})

local navic = require("nvim-navic")
navic.setup({
	lsp = {
		auto_attach = true,
	},
	highlight = true,
	depth_limit = 5,
})

local navbuddy = require("nvim-navbuddy")
navbuddy.setup({
	lsp = {
		auto_attach = true, -- If set to true, you don't need to manually use attach function
		preference = nil, -- list of lsp server names in order of preference
	},
})

mason_lspconf.setup_handlers({
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
		--     navic.attach(client, ev.buf)
		-- end

		local opts = { buffer = ev.buf }
		_G.map("n", "gD", vim.lsp.buf.declaration, opts)
		_G.map("n", "gd", vim.lsp.buf.definition, opts)
		_G.map("n", "K", vim.lsp.buf.hover, opts)
		_G.map("n", "ws", vim.lsp.buf.workspace_symbol, opts)
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
