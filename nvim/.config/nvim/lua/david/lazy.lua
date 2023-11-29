local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- Already lua nvim-ed
    "lukas-reineke/indent-blankline.nvim",
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

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},

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

    "folke/zen-mode.nvim",

    -- Markdown viewer yeiiiiiiia
    "ellisonleao/glow.nvim",

	-- Debugger (Learn to use lollll)
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",

    -- Colorscheme section
    "gruvbox-community/gruvbox",

	-- Legacy
    "lervag/vimtex",
    "will133/vim-dirdiff",
})
