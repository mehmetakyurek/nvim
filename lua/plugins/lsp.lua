return {
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({

				ensure_installed = { "lua_ls", "rust_analyzer", "gopls" },
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local servers = {
				lua_ls = {
					-- cmd = {...},
					-- filetypes { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								-- Tells lua_ls where to find all the Lua files that you have loaded
								-- for your neovim configuration.
								library = {
									"${3rd}/luv/library",
									unpack(vim.api.nvim_get_runtime_file("", true)),
								},
								-- If lua_ls is really slow on your computer, you can try this instead:
								-- library = { vim.env.VIMRUNTIME },
							},
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}
			require("mason-lspconfig").setup_handlers({
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					local server = servers[server_name] or
						{} -- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities,
						server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			'onsails/lspkind.nvim',
		},
		config = function()
			vim.opt.completeopt = { "menu", "menuone", "noselect" }
			local lspconfig = require("lspconfig")
			local luasnip = require("luasnip")
			local servers = {
				"lua_ls",
				"ts_ls",
			}
			-- for _, lsp in ipairs(servers) do
			-- 	local capabilities = require('cmp_nvim_lsp').default_capabilities()
			-- 	lspconfig[lsp].setup({
			-- 		-- on_attach = my_custom_on_attach,
			-- 		capabilities = capabilities,
			-- 	})
			-- end
			local cmp = require("cmp")
			local lspkind = require('lspkind')
			cmp.setup({
				preselect = cmp.PreselectMode.None,
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol-text', -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- can also be a function to dynamically calculate max width such as
						-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
						ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default
						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(entry, vim_item)
							return vim_item
						end
					})
				},

				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.Config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = 'luasnip' },
					{ name = 'treesitter' }
				},
				mapping = cmp.mapping.preset.insert({
					["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
					["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
			})
		end,
	},
}
