local lsp_zero = require("lsp-zero")

--------------------------------------------------------------------------
------------------ LSP CONFIG --------------------------------------------
--------------------------------------------------------------------------
lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = ''
})

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

local on_attach = function(client, bufnr)

  lsp_zero.default_keymaps({buffer = bufnr})

  vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, { buffer = bufnr })
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr })
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = bufnr })
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = bufnr })
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = bufnr })

end

lsp_zero.on_attach(on_attach)

--------------------------------
------- LANGUAGE SERVERS -------
--------------------------------

require('mason').setup({})
require('mason-lspconfig').setup({

  ensure_installed = {'tsserver', 'rust_analyzer', 'pylsp', 'lua_ls'},
  handlers = {
    lsp_zero.default_setup,

    pylsp = function ()
        require("lspconfig").pylsp.setup {
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = {'E221', 'E501'},
                            maxLineLength = 100
                        }
                    }
                }
            }
        }
    end,

    rust_analyzer = function ()
        require("rust-tools").setup {}
    end,

    lua_ls = function ()
        require("lspconfig").lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
  }
})

--------------------------------------------------------------------------
------------------ C # ---------------------------------------------------
--------------------------------------------------------------------------

require("roslyn").setup({
    dotnet_cmd = "dotnet", -- this is the default
    roslyn_version = "4.9.0-3.23604.10", -- this is the default
    on_attach = on_attach, -- required
    capabilities = capabilities, -- required
})

--------------------------------------------------------------------------
------------------ AUTOCOMPLETION ----------------------------------------
--------------------------------------------------------------------------

local cmp = require('cmp')


cmp.setup({
  --completion = {
  --  autocomplete = false
  --},
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>']      = cmp.mapping.confirm({select = false}),
  }),
  formatting = {
    fields = {'abbr', 'kind', 'menu'},
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  }
})


-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
-- })

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- lsp_zero.setup()
