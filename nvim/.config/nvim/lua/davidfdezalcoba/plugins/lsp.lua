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

vim.opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",

	callback = function(args)
		local opts = { buffer = args.buf }
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "terraformls" then
			client.server_capabilities.semanticTokensProvider = nil
		end
		vim.keymap.set("n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
	end,
})

vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig", },
  { src = "https://github.com/williamboman/mason.nvim", },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim", },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp", },
  { src = "https://github.com/hrsh7th/cmp-buffer", },
  { src = "https://github.com/hrsh7th/cmp-path", },
  { src = "https://github.com/hrsh7th/cmp-cmdline", },
  { src = "https://github.com/hrsh7th/nvim-cmp", },
  { src = "https://github.com/L3MON4D3/LuaSnip", },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip", },
  { src = "https://github.com/j-hui/fidget.nvim", },
  { src = "https://github.com/onsails/lspkind-nvim", },
  { src = "https://github.com/nvimdev/lspsaga.nvim", },
})

require("fidget").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"ts_ls",
		"rust_analyzer",
		"basedpyright",
		"ruff",
		"lua_ls",
		"helm_ls",
		"jsonls",
		"yamlls",
		"terraformls",
	},
	automatic_enable = {
		exclude = {
			"ruff",
		},
	},
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

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust_analizer"] = {
			diagnostics = {
				enable = true,
				experimental = {
					enable = true,
				},
			},
		},
	},
})

vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			schemas = {
				["kubernetes"] = "/*.yaml",
				["none"] = "/Chart.yaml",
			},
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
					luasnip.expand()
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
			elseif luasnip.locally_jumpable(1) then
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
