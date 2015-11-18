" git clone git://github.com/klen/python-mode.git

" pathogen plugin
" https://github.com/tpope/vim-pathogen
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

" tabs
set tabstop=8 
set shiftwidth=4 
set softtabstop=4  
set expandtab 
" set smarttab

set colorcolumn=80
set number
set ruler
set cursorline
set t_Co=256
:imap ` <Esc>

" solarized
" http://ethanschoonover.com/solarized/vim-colors-solarized
" let g:solarized_visibility = "high"
" let g:solarized_termcolors = 16 
" let g:solarized_contrast = "low"
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized 

" python settings
" autocmd BufWritePre *.py :%s/\s\+$//e
" autocmd Filetype python setlocal ts=4 sts=4 sw=4 et
" autocmd Filetype json setlocal ts=2 sts=2 sw=2 et

" no sound
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" tslime
" git://github.com/jpalardy/vim-slime.git
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

