local Remap = require("david.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<C-J>", "<C-W><C-J>")
nnoremap("<C-K>", "<C-W><C-K>")
nnoremap("<C-L>", "<C-W><C-L>")
nnoremap("<C-H>", "<C-W><C-H>")
nnoremap("<leader><space>", ":nohl<CR>")
inoremap("jk", "<esc>")
nnoremap("-", ":Explore<CR>")
nnoremap("<F5>", ":source $MYVIMRC<CR>")
inoremap("<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

nnoremap("<C-h>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", { silent = true })
nnoremap("<C-j>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", { silent = true })
nnoremap("<C-k>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", { silent = true })
nnoremap("<C-l>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", { silent = true })
nnoremap("<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", { silent = true })
nnoremap("<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", { silent = true })
