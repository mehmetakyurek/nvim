return {
	"nvim-tree/nvim-tree.lua",
	enabled = false,

	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		require("nvim-tree").setup()
		vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeOpen<cr>")
	end,
}
