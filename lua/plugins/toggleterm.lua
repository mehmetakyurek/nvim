return {
	-- amongst your other plugins
	'akinsho/toggleterm.nvim',
	config = function()
		require("toggleterm").setup {

			size = 20,
			open_mapping = [[<c-\>]],
			direction = 'float',
			version = "*",
		}
	end
}
