vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<leader><space>", "<cmd>nohl<CR>")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "<F5>", "<cmd>source $MYVIMRC<CR>")
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

vim.keymap.set("n", "]c", "j]czz")

vim.keymap.set("n", "<C-h>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>")
vim.keymap.set("n", "<C-\\>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>")
vim.keymap.set("n", "<C-Space>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>")

vim.keymap.set("v", "<leader>be", "<cmd>lua require'b64'.encode()<cr>", { silent = true, noremap = true})
vim.keymap.set("n", "<leader>bd", "viW<cmd>lua require'b64'.decode()<cr>", { silent = true, noremap = true})
