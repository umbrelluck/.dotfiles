local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local noice

status_ok, noice = pcall(require, "noice")
if not status_ok then
	return
end

local clients_lsp = function()
	local bufnr = vim.api.nvim_get_current_buf()

	local clients = vim.lsp.buf_get_clients(bufnr)
	if next(clients) == nil then
		return ""
	end

	local c = {}
	for _, client in pairs(clients) do
		table.insert(c, client.name)
	end
	return " " .. table.concat(c, "|")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "onedark",
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			"mode",
			"filename",
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { clients_lsp, "require('lsp-progress').progress()" },
		lualine_x = {
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = {
			{
				noice.api.status.message.get_hl,
				cond = noice.api.status.message.has,
			},
			{
				noice.api.status.search.get,
				cond = noice.api.status.search.has,
				color = { fg = "#ff9e64" },
			},
		},
		lualine_z = { "progress", "location" },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
})

-- vim.cmd([[
-- augroup lualine_augroup
--     autocmd!
--     autocmd User LspProgressStatusUpdated lua lualine.refresh()
-- augroup END
-- ]])
