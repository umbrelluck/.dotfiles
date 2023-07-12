return {
	"rcarriga/nvim-notify",
	opts = {
		render = "compact",
		top_down = false,
		stages = "fade",
		timeout = 1500,
	},
	config = function()
		vim.notify = require("notify")
	end,
}
