local function keymaps()
	local builtin = require("telescope.builtin")
	local function map(key, func, opt)
		vim.keymap.set("n", key, func, opt)
	end
	map("<leader>sf", "<cmd>Telescope find_files hidden=false no_ignore=true<cr>", { desc = "find_files" })
	map("<leader>sgf", builtin.git_files, { desc = "git_files" })
	map("<leader>swg", builtin.live_grep, { desc = "live_grep" })
	map("<leader>sd", builtin.live_grep, { desc = "live_grep" })

	map("<leader><leader>", builtin.buffers, { desc = "buffers" })

	map("<leader>smp", builtin.man_pages, { desc = "man_pages" })

	map("<leader>sh", builtin.help_tags, { desc = "help_tags" })

	map("<leader>/", builtin.current_buffer_fuzzy_find, { desc = "current_buffer_fuzzy_find" })
	-- vim.keymap.set('n', '<leader>/', function()
	-- 	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	-- 	})
	-- end, { desc = '[/] Fuzzily search in current buffer' })

	map("<leader>sk", builtin.keymaps, { desc = "keymaps" })
	-- lsp
	map("<leader>li", builtin.lsp_incoming_calls)
	map("<leader>lo", builtin.lsp_outgoing_calls)
	map("<leader>ds", builtin.lsp_document_symbols, { desc = "document_symbols" })
	map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "lsp_workspace_symbols" })
	map("<leader>dd", builtin.diagnostics)
	map("<leader>ca", vim.lsp.buf.code_action)
	-- map("<leader>wd", builtin.diagnostics, { desc = "lsp_document_symbols" })
	map("gi", builtin.lsp_implementations, { desc = "lsp_implementations" })
	map("gd", builtin.lsp_definitions, { desc = "lsp_definitions" })
	map("gr", builtin.lsp_references, { desc = "lsp_references" })
	map("<leader>gtd", builtin.lsp_type_definitions, { desc = "type_definitions" })
	--git
	map("<leader>sgc", builtin.git_commits)
	map("<leader>sgb", builtin.git_branches)
	map("<leader>sgs", builtin.git_status)
	vim.keymap.set('n', '<leader>sn', function()
		builtin.find_files { cwd = vim.fn.stdpath 'config' }
	end, { desc = '[S]earch [N]eovim files' })
	vim.keymap.set('n', '<leader>sv', function()
		builtin.find_files { cwd = '~/vaults/personal' }
	end, { desc = '[S]earch [V]ault' })
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
					},
					file_browser = {
						hijack_netrw = false
					}
				},
				pickers = {
					current_buffer_fuzzy_find = {
						theme = "dropdown",
					}
				},
				defaults = {
					layout_config = {
						-- other layout configuration here
					},
					file_ignore_patterns = {
						"node_modules",

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
				":Telescope file_browser hidden=false path=%:p:h select_buffer=true<CR>",
				{ noremap = true }
			)
		end,
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

}
