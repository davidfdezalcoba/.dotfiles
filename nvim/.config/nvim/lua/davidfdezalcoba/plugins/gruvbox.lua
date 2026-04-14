vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim", },
})

require("gruvbox").setup({
	terminal_colors = true,
})

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
