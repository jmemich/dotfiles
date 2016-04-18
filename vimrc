execute pathogen#infect()

" solarized
" http://ethanschoonover.com/solarized/vim-colors-solarized
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized 

" tslime.vim
" https://github.com/jgdavey/tslime.vim

syntax on

set colorcolumn=80
set number
set ruler
set cursorline
set pastetoggle=<F2>
set showmatch

set tabstop=4
set shiftwidth=4
set softtabstop=4

set smarttab
set expandtab
set autoindent

:set ignorecase
:set smartcase

:imap jk <Esc>

set splitbelow
set splitright

" navigate between window panes with Ctrl + h
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_


if has("autocmd")
    filetype plugin indent on
endif

autocmd Filetype python setlocal ts=4 sts=4 sw=4 et
autocmd Filetype json setlocal ts=2 sts=2 sw=2 et

let g:sql_type_default = 'pgsql'
