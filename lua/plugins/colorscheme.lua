return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").load("wave")
		end
	},
	-- {
	-- 	"bluz71/vim-moonfly-colors",
	-- 	name = "moonfly",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("colorscheme moonfly")
	-- 	end
	-- },
	-- { 'rktjmp/lush.nvim' },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			highlight_groups = {
	-- 				Normal = { bg = "#151515" },
	-- 				NormalNC = { bg = "#151515" },
	-- 			},
	-- 		})
	--
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end
	-- }

}
