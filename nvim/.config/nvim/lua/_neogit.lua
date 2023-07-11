local neogit = require("neogit")
neogit.setup({})

local actions = require("diffview.actions")
require("diffview").setup({
	disable_commit_confirmation = true,
})
