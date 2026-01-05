return {
	{
		"github/copilot.vim",
		cond = function()
			return vim.env.NVIM_PROFILE == "work"
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {},
		cond = function()
			return vim.env.NVIM_PROFILE == "work"
		end,
	},
}
