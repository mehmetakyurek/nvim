vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup("lspa", {}),
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
		-- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	end
})
