vim.opt.guicursor = ""
vim.opt.mouse = "a"

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.path += "**"

vim.opt.showmatch = true
vim.opt.matchtime = 10

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 0 -- 8
-- vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.laststatus = 2
vim.opt.statusline = "%F%m%=%l/%L:%c"

vim.opt.spelllang = "es,en_gb"
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 99

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- vim.opt.colorcolumn = "80"

vim.g.mapleader = ","
vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/py3nvim/bin/python"

vim.g.netrw_liststyle = 3
vim.g.netrw_list_hide = "^\\..*"
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 20
vim.g.netrw_altv = 1
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"
vim.g.netrw_hide = 1

-- vim.g.tex_conceal='abdmg'
-- vim.g.vimtex_compiler_latexmk = {'build_dir' : 'build'}"
vim.g.tex_flavor='latex'
vim.g.vimtex_view_method='zathura'
vim.g.vimtex_quickfix_mode=0
vim.g.UltiSnipsExpandTrigger='<leader><tab>'
vim.g.UltiSnipsJumpForwardTrigger='<leader><tab>'
vim.g.UltiSnipsJumpBackwardTrigger='<s-tab>'

vim.g.DirDiffExcludes = ".git"
