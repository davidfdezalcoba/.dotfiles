vim.pack.add({
  { src = "https://github.com/alexghergh/nvim-tmux-navigation", },
	{ src = "https://github.com/will133/vim-dirdiff", },
	{ src = "https://github.com/Wansmer/treesj", },
	{ src = "https://github.com/mbbill/undotree", },
	{ src = "https://github.com/tpope/vim-fugitive", },
	{ src = "https://github.com/taybart/b64.nvim", },
	{ src = "https://github.com/qvalentin/helm-ls.nvim", }, -- ft = { "helm", "mustache" } },
	{ src = "https://github.com/google/vim-jsonnet", }, -- ft = { "jsonnet" } },
	{ src = "https://github.com/lepture/vim-jinja", }, -- ft = { "jinja2", "j2" } },
	{ src = "https://github.com/prisma/vim-prisma", }, -- ft = { "prisma" } },
})

require("treesj").setup({ use_default_keymaps = false, max_join_length = 150, })
