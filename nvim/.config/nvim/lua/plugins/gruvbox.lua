return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
			})

			vim.o.background = "dark"
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
