return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		deault_file_explorer = true,
		float = {
			-- Padding around the floating window
			padding = 2,
			max_width = 80,
			max_height = 0,
			border = "rounded",
			win_options = {
				winblend = 1,
			},
			-- preview_split: Split direction: "auto", "left", "right", "above", "below".
			preview_split = "auto",
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			override = function(conf)
				return conf
			end,
		},
		keymaps = {
			["q"] = "actions.close",
			["<Escape>"] = "actions.close"

		}
	},
	init = function()
		vim.keymap.set("n", "<leader>oi", "<cmd>Oil<cr>")
	end,
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
