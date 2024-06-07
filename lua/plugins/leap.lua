return {
	{
		"ggandor/leap.nvim",
		enabled = false,
		config = function()
			vim.keymap.set({ "n", "x", "o" }, ">", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "<", "<Plug>(leap-backward)")
			vim.keymap.set({ "n", "x", "o" }, "g>", "<Plug>(leap-from-window)")
		end,
	},
}
