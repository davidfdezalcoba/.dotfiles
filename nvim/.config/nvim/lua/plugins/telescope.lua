return {
  -- { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
  -- {
  --   "nvim-telescope/telescope.nvim",

  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope-fzf-native.nvim"
  --   },

  --   config = function()
  --     require('telescope').setup({})
  --     require('telescope').load_extension('fzf')

  --     -- local builtin = require('telescope.builtin')
  --     -- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  --     -- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  --     -- vim.keymap.set('n', '<leader>fw', function()
  --     --     local word = vim.fn.expand("<cword>")
  --     --     builtin.grep_string({ search = word })
  --     -- end)
  --     -- vim.keymap.set('n', '<leader>fW', function()
  --     --     local word = vim.fn.expand("<cWORD>")
  --     --     builtin.grep_string({ search = word })
  --     -- end)
  --     -- vim.keymap.set('n', '<leader>ft', function()
  --     --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
  --     -- end)
  --     -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  --   end,
  -- },
}
