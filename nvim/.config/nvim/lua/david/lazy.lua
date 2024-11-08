-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- Already lua nvim-ed
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    "alexghergh/nvim-tmux-navigation",

    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- Treeshitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },

    "romgrk/nvim-treesitter-context",
    "nvim-treesitter/playground",

    "mbbill/undotree",
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    "taybart/b64.nvim",

    "nvim-lua/lsp_extensions.nvim",
    "glepnir/lspsaga.nvim",
    "onsails/lspkind-nvim",
    "simrat39/symbols-outline.nvim",
    'simrat39/rust-tools.nvim',

    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },

    -- LSP Support
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'SirVer/ultisnips'},
    {'hrsh7th/cmp-nvim-lua'},
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},

    -- Roslyn C# until Mason supports it
    {'jmederosalvarado/roslyn.nvim'},

    "folke/zen-mode.nvim",

    -- Syntax highlighting
    'towolf/vim-helm',

	-- Debugger (Learn how to use lollll)
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",

    -- Colorscheme section
    "gruvbox-community/gruvbox",

	-- Legacy
    "lervag/vimtex",
    "will133/vim-dirdiff",
})
