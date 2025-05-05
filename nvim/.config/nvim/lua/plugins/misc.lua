return {
  "alexghergh/nvim-tmux-navigation",

  -- Treeshitter
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate"
  },

  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/playground",

  "mbbill/undotree",
  "tpope/vim-fugitive",
  "taybart/b64.nvim",

  "folke/zen-mode.nvim",

  -- Syntax highlighting
  {'towolf/vim-helm', ft = {'helm', 'mustache'}},
  {'google/vim-jsonnet', ft = {'jsonnet'}},
  {'lepture/vim-jinja', ft = {'jinja2', 'j2'}},

  -- Debugger (Learn how to use lollll)
  "mfussenegger/nvim-dap",
  "nvim-neotest/nvim-nio",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",

  -- Legacy
  "lervag/vimtex",
  "will133/vim-dirdiff",
}
