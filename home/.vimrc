set nocompatible
filetype off

execute pathogen#infect()

filetype plugin on
filetype indent on

" basic setup
""""""""""""""""""""""""""""""
" TODO auto-update changes to file
set ignorecase
set pastetoggle=<F2>
set ruler
set colorcolumn=80
set number
set cursorline
set showmatch

" no sound
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" colours and font
""""""""""""""""""""""""""""""
" http://ethanschoonover.com/solarized/vim-colors-solarized
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized 
syntax enable
set encoding=utf8

" files and backup
""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

" text, tab, indent
""""""""""""""""""""""""""""""
set expandtab
set smarttab
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype c setlocal ts=4 sts=4 sw=4
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2 et
autocmd BufNewFile,BufRead *.json setlocal ts=2 sts=2 sw=2  "TODO Filetype !?!?
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" key bindings
""""""""""""""""""""""""""""""
:imap jk <Esc>

" vim splitting 
""""""""""""""""""""""""""""""
set splitbelow
set splitright

" buffers 
""""""""""""""""""""""""""""""
set hidden
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal! g`\"" |
   \ endif
" Remember info about open buffers on close
set viminfo^=%

" sytntastic
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_debug = 1

" TODO get errors/warnings without closing screen popup
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 3

let g:sql_type_default = 'pgsql'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_ruby_checkers = ['rubocop'] 
let g:syntastic_ruby_rubocop_exec = '/Users/civisemployee/.rbenv/shims/rubocop'

" tslime
""""""""""""""""""""""""""""""
" git://github.com/jpalardy/vim-slime.git
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
