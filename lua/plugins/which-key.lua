return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")

		wk.register({
			s = { name = "+search" },
			l = { name = "+lsp" },
			g = {
				name = "+goto",
				t = { name = "+type" },
			},
			d = { name = "+document" },
			w = { name = "+workspace" },
		}, { prefix = "<leader>" })
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
	},
}
