--------------------------------------------------------------------------
------------------ LSP CONFIG --------------------------------------------
--------------------------------------------------------------------------

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
	float = {
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		-- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		-- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		-- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		-- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		-- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		-- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		-- vim.keymap.set('n', '<leader>vws', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', opts)
		-- vim.keymap.set('n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
	end,
})

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = {
					"stylua",
				},
				terraform = {
					"terraform_fmt",
				},
				python = {
					"ruff_fix",
					"ruff_format",
					"ruff_organize_imports",
				},
			},
		},
		keys = {
			{
				"<leader>F",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
			"onsails/lspkind-nvim",
			"nvimdev/lspsaga.nvim",
      "JavaHello/spring-boot.nvim",
		},

		config = function()
			require("fidget").setup({})
			require("mason").setup()
			require("mason-nvim-dap").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"ts_ls",
					"rust_analyzer",
					"basedpyright",
					"ruff",
					"lua_ls",
					"helm_ls",
					"yamlls",
					"terraformls",
				},
				automatic_enable = {
					exclude = {
						"ruff",
					},
				},
			})

      require('spring_boot').init_lsp_commands()

      vim.lsp.config("jdtls", {
        settings = {
          init_options = {
            bundles = require("spring_boot").java_extensions(),
          },
        }
      })

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						typeCheckingMode = "basic",
					},
				},
			})

			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				window = {
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand_or_locally_jumpable()()
							else
								cmp.confirm({
									select = false,
								})
							end
						else
							fallback()
						end
					end),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = require("lspkind").cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
}
