vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true

vim.opt.relativenumber = true

vim.opt.undofile = true

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

vim.opt.signcolumn = "yes"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 4

vim.cmd("language en_US")

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
