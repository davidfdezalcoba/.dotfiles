vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim", },
  { src = "https://github.com/folke/which-key.nvim", },
})

require("snacks").setup({
  indent = {
    animate = {
      enabled = false,
    },
  },
  input = {},
  notifier = {},
  scroll = {},
  -- words = {},
  explorer = {},
  picker = {
    sources = {
      explorer = {
        jump = {
          close = true
        },
        matcher = {
          fuzzy = true
        }
      }
    }
  },
})

require("which-key").setup({ preset = "helix", })
