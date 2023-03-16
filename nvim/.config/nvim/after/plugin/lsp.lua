local Remap = require("david.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp = require("cmp")
local source_mapping = {
	-- youtube = "[Suck it YT]",
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	path = "[Path]",
}

local luasnip = require("luasnip")
local lspkind = require("lspkind")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

    completion = {
      autocomplete = false
    },

	mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

	}),

	formatting = {
        format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end,
        -- format = lspkind.cmp_format({
        --   mode = 'symbol', -- show only symbol annotations
        --   maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- })
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},

})

local on_attach = function()
	nnoremap("gd", function() vim.lsp.buf.definition() end)
	nnoremap("gi", function() vim.lsp.buf.implementation() end)
	nnoremap("K", function() vim.lsp.buf.hover() end)
	nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
	nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
	nnoremap("<leader>vf", function() vim.lsp.buf.format() end)
	nnoremap("[d", function() vim.diagnostic.goto_next() end)
	nnoremap("]d", function() vim.diagnostic.goto_prev() end)
	nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
	nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
	nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
	inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
end

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = on_attach,
	}, _config or {})
end

-- Language-specific configs
require("flutter-tools").setup {
    lsp = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach,
    },
    debugger = { -- integrate with nvim dap + install dart code debugger
        enabled = true,
        run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
        -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
        -- see |:help dap.set_exception_breakpoints()| for more info
        exception_breakpoints = {},
        register_configurations = function(paths)
          require("dap").adapters.dart = {
            type = "executable",
            command = "node",
            args = {os.getenv('HOME').."/Software/dart-debug/Dart-Code/out/dist/debug.js", "flutter"}
          }
          require("dap").configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Launch flutter",
              dartSdkPath = os.getenv('HOME').."/snap/flutter/common/cache/dart-sdk/",
              flutterSdkPath = os.getenv('HOME').."/snap/flutter/common",
              program = "${workspaceFolder}/main.dart",
              cwd = "${workspaceFolder}",
            }
          }
        end,
    },
    -- flutter_path = "/home/davidfdezalcoba/snap/flutter/common/flutter",
}

require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 100
        }
      }
    }
  }
}

local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}

require("symbols-outline").setup(opts)

local snippets_paths = function()
	local plugins = { "friendly-snippets" }
	local paths = {}
	local path
	local root_path = vim.env.HOME .. "/.vim/plugged/"
	for _, plug in ipairs(plugins) do
		path = root_path .. plug
		if vim.fn.isdirectory(path) ~= 0 then
			table.insert(paths, path)
		end
	end
	return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
	paths = snippets_paths(),
	include = nil, -- Load all languages
	exclude = {},
})
