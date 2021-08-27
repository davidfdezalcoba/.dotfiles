"Start plugin section
call plug#begin('~/.config/.vim/nplugged')

Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'will133/vim-dirdiff'
Plug 'gruvbox-community/gruvbox'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

filetype plugin indent on

"Colors
syntax enable
let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark="hard"
set background=dark
colorscheme gruvbox
set termguicolors
"Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Tabs
set tabstop=4
set softtabstop=4
set path+=**
"UI
set number
set cursorline
set wildmenu
set lazyredraw
set showmatch
set matchtime=10
hi StatusLine ctermbg = lightgreen ctermfg = black cterm = NONE
hi StatusLineNC ctermbg = darkgreen ctermfg = black cterm = NONE
"Search
set incsearch
set hlsearch
"Key maps
let mapleader=","
nnoremap <leader><space> :nohl<CR>
inoremap jk <esc>
nnoremap - :Explore<CR>
nnoremap <F5> :source $MYVIMRC<CR>
"Fold options
set foldmethod=syntax
set foldlevel=10
"Tags
set tags=tags;

"FileTree Options
autocmd FileType netrw setl bufhidden=delete
let g:netrw_liststyle = 3
let g:netrw_list_hide = '^\..*'
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_winsize = 20
let g:netrw_altv = 1

let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
let g:netrw_hide = 1

"Statusline
set laststatus=2
set statusline=
set statusline+=%F
set statusline+=%m
set statusline+=%=
set statusline+=%l\/
set statusline+=%L
set statusline+=:
set statusline+=%c
"Debug
let g:termdebug_wide=1
"Latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
"Ultisnips
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
"Spelling
"setlocal spell Commented because we only want it in tex files
set spelllang=es,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" IndentLine
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0
" tmux
" set term=xterm-256color
" set mouse priority to vim over tmux
set mouse=a
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
