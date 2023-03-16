 return require('packer').startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    
    -- Already lua nvim-ed
    use("lukas-reineke/indent-blankline.nvim")
    use("alexghergh/nvim-tmux-navigation")

    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-fzy-native.nvim")
    
    -- Treeshitter
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("romgrk/nvim-treesitter-context")
    use("nvim-treesitter/playground")

    use("mbbill/undotree")
    use("tpope/vim-fugitive")

    
	-- Replacing coc
    -- use("neovim/nvim-lspconfig")
    -- use("hrsh7th/nvim-cmp")
    -- use("hrsh7th/cmp-nvim-lsp")
    -- use("hrsh7th/cmp-buffer")
    -- use("hrsh7th/cmp-path")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("onsails/lspkind-nvim")
    use("simrat39/symbols-outline.nvim")
    -- use("L3MON4D3/LuaSnip")
    -- use("saadparwaiz1/cmp_luasnip")
    -- use("SirVer/ultisnips")
    --
    -- we'll see about this
    use("akinsho/flutter-tools.nvim", {
	    requires = "nvim-lua/plenary.nvim"
    })

    use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
          {'SirVer/ultisnips'},
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
    }

    use("folke/zen-mode.nvim")
    


    -- Markdown viewer yeiiiiiiia
    use("ellisonleao/glow.nvim")

	-- Debugger (Learn to use lollll)
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")

	-- Legacy
    use("lervag/vimtex")
    use("will133/vim-dirdiff")

end)
