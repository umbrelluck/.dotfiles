local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	render = "compact",
	top_down = false,
	stages = "fade",
	timeout = 1500,
})

vim.notify = notify
