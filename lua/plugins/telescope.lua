local function keymaps()
	local builtin = require("telescope.builtin")
	local actions = require("telescope.actions")
	local function map(key, func, opt)
		vim.keymap.set("n", key, func, opt)
	end
	map("<leader>sf", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", { desc = "find_files" })
	map("<leader>sr", builtin.resume, { desc = "resume" })
	map("<leader>sg", builtin.live_grep, { desc = "live_grep" })
	map("<leader>sb", builtin.buffers, { desc = "buffers" })
	map("<leader>sh", builtin.help_tags, { desc = "help_tags" })
	map("<leader>sk", builtin.keymaps, { desc = "keymaps" })
	map("<leader>dt", builtin.treesitter, { desc = "treesitter" })
	map("<leader>tp", builtin.fd, { desc = "pickers" })
	map("<leader>zr", builtin.reloader, { desc = "reloader" })
	-- lsp
	map("gr", builtin.lsp_references, { desc = "lsp_references" })
	map("<leader>ds", builtin.lsp_document_symbols, { desc = "document_symbols" })
	map("<leader>ws", builtin.lsp_workspace_symbols, { desc = "lsp_workspace_symbols" })
	map("<leader>wd", builtin.diagnostics, { desc = "lsp_document_symbols" })
	map("gi", builtin.lsp_implementations, { desc = "lsp_implementations" })
	map("gd", builtin.lsp_definitions, { desc = "lsp_definitions" })
	map("<leader>gtd", builtin.lsp_type_definitions, { desc = "type_definitions" })
	map("<leader>mp", builtin.man_pages, { desc = "man_pages" })
	-- map("<leader>/", builtin.current_buffer_fuzzy_find, { desc = "current_buffer_fuzzy_find" })
	map("<leader>s/", function()
		builtin.live_grep({
			grep_open_files = true,
			prompt_title = "Live Grep in Open Files",
		})
	end, { desc = "grep_open_files " })
	vim.keymap.set('n', '<leader>/', function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 10,
			previewer = false,
		})
	end, { desc = '[/] Fuzzily search in current buffer' })
end

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- local builtin = require("telescope.builtin")
			keymaps()
			require('telescope').setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					}
				},

				defaults = {
					layout_config = {
						-- other layout configuration here
					},
					-- other defaults configuration here
				},
				-- other configuration values here
			})
			-- lsp
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<space>fb",
				":Telescope file_browser hidden=true path=%:p:h select_buffer=true<CR>",
				{ noremap = true }
			)
		end,
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

}
