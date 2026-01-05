return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = {
					"stylua",
				},
				terraform = {
					"terraform_fmt",
				},
				python = {
					"ruff_fix",
					"ruff_format",
					"ruff_organize_imports",
				},
        prisma = { "prisma" },
				json = { "prettier", },
				yaml = { "prettier", },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
			},
      formatters = {
        prisma = {
          command = "npx",
          args = { "prisma", "format", "--schema", "$FILENAME" },
          stdin = false, -- Prisma reads from file
        }
      },
		},
		keys = {
			{
				"<leader>F",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
	},
}
