" vimrc — managed by ~/dotfiles
" Plugins via vim-plug. Bootstrap installs vim-plug on first run.

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------
call plug#begin()
Plug 'jpalardy/vim-slime'                     " send buffer/selection to tmux REPL
Plug 'christoomey/vim-tmux-navigator'         " seamless Ctrl+hjkl across vim+tmux
Plug 'dense-analysis/ale'                     " async linting (replaces syntastic)
Plug 'catppuccin/vim', { 'as': 'catppuccin' } " colorscheme to match Ghostty
call plug#end()

" ---------------------------------------------------------------------------
" Basic settings
" ---------------------------------------------------------------------------
set nocompatible
filetype plugin indent on
syntax enable

set encoding=utf-8
set ignorecase
set ruler
set number
set cursorline
set showmatch
set colorcolumn=80
set pastetoggle=<F2>

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" no on-disk backups
set nobackup
set nowritebackup
set noswapfile

" indent / tab defaults
set expandtab
set smarttab
set autoindent
set smartindent
set wrap
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" per-filetype indent rules
autocmd Filetype python     setlocal ts=4 sts=4 sw=4 et
autocmd Filetype c          setlocal ts=4 sts=4 sw=4
autocmd Filetype cpp        setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby       setlocal ts=2 sts=2 sw=2
autocmd Filetype html       setlocal ts=2 sts=2 sw=2
autocmd Filetype css        setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml       setlocal ts=2 sts=2 sw=2 et
autocmd Filetype sql        setlocal ts=4 sts=4 sw=4 et
autocmd BufNewFile,BufRead *.json setlocal ts=2 sts=2 sw=2

" splits
set splitbelow
set splitright

" buffers
set hidden
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif
set viminfo^=%

" ---------------------------------------------------------------------------
" Key bindings
" ---------------------------------------------------------------------------
:imap jk <Esc>

" ---------------------------------------------------------------------------
" Plugin config
" ---------------------------------------------------------------------------
" vim-slime -> tmux + IPython
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" ALE
let g:ale_linters = {'python': ['flake8'], 'sql': []}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:sql_type_default = 'pgsql'

" ---------------------------------------------------------------------------
" Color scheme
" ---------------------------------------------------------------------------
set termguicolors                          " true color
silent! colorscheme catppuccin_mocha       " falls back silently if plugin missing
