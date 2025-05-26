return {
  {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      indent = {},
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
    },
    keys = {
      { "-", function() Snacks.explorer() end, desc = "File Explorer" },
      { "<leader>rr", function() Snacks.picker.registers() end, desc = "Registers" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "File Explorer" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declaration() end, desc = "Goto Definition" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>fj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    }
  }
}
