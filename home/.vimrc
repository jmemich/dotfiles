execute pathogen#infect()

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1

" solarized
" http://ethanschoonover.com/solarized/vim-colors-solarized
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized 

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

" set smarttab
set expandtab
set autoindent

:set ignorecase
:set smartcase

:imap jk <Esc>

set splitbelow
set splitright

set hidden

if has("autocmd")
    filetype plugin indent on
endif

" TODO get json working
" autocmd Filetype python setlocal ts=4 sts=4 sw=4 et
" autocmd Filetype json setlocal ts=2 sts=2 sw=2 et

let g:sql_type_default = 'pgsql'

" no sound
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" tslime
" git://github.com/jpalardy/vim-slime.git
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
