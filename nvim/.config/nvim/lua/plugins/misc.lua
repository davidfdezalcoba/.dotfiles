return {
	"alexghergh/nvim-tmux-navigation",
	"will133/vim-dirdiff",

	{
		"Wansmer/treesj",
		keys = {
			{ "<leader>J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
		},
		opts = { use_default_keymaps = false, max_join_length = 150 },
	},

	"mbbill/undotree",
	"tpope/vim-fugitive",
	"taybart/b64.nvim",

	-- Syntax highlighting
	{ "towolf/vim-helm", ft = { "helm", "mustache" } },
	{ "google/vim-jsonnet", ft = { "jsonnet" } },
	{ "lepture/vim-jinja", ft = { "jinja2", "j2" } },
	{ "prisma/vim-prisma", ft = { "prisma" } },
}
