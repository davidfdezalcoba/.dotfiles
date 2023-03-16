-- local M = {}
-- 
-- local function bind(op, outer_opts)
--     outer_opts = outer_opts or {noremap = true}
--     return function(lhs, rhs, opts)
--         opts = vim.tbl_extend("force",
--             outer_opts,
--             opts or {}
--         )
--         vim.keymap.set(op, lhs, rhs, opts)
--     end
-- end
-- 
-- M.nmap = bind("n", {noremap = false})
-- M.nnoremap = bind("n")
-- M.vnoremap = bind("v")
-- M.xnoremap = bind("x")
-- M.inoremap = bind("i")
-- 
-- return M
-- 

vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<leader><space>", "<cmd>nohl<CR>")
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "-", "<cmd>Explore<CR>")
vim.keymap.set("n", "<F5>", "<cmd>source $MYVIMRC<CR>")
vim.keymap.set("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- diff in the " ", middle 
vim.keymap.set("n", "]c", "j]czz")

vim.keymap.set("n", "<C-h>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>")--, { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>")--, { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>")--, { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>")--, { silent = true })
vim.keymap.set("n", "<C-\\>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>")--, { silent = true })
vim.keymap.set("n", "<C-Space>", "<cmd>lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>")--, { silent = true })
