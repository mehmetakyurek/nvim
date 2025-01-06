return {
	"leath-dub/snipe.nvim",
	keys = {
		{ "<leader>sp", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
	},
	opts = { ui = { position = "cursor" } },
	init = function()
		local snipe = require("snipe")
		snipe.ui_select_menu = require("snipe.menu"):new { position = "center" }
		snipe.ui_select_menu:add_new_buffer_callback(function(m)
			vim.keymap.set("n", "<esc>", function()
				m:close()
			end, { nowait = true, buffer = m.buf })
		end)
		vim.ui.select = snipe.ui_select;
	end
}
