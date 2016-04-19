execute pathogen#infect()

" solarized
" http://ethanschoonover.com/solarized/vim-colors-solarized
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized 

" TODO
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

if has("autocmd")
    filetype plugin indent on
endif

" TODO get json working
autocmd Filetype python setlocal ts=4 sts=4 sw=4 et
autocmd Filetype json setlocal ts=2 sts=2 sw=2 et

let g:sql_type_default = 'pgsql'
