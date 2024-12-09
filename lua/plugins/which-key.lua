return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	enabled = false,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")

		wk.add({
		})
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
	},
}
