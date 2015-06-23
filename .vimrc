" AUTOCOMPLETE & HIGHLIGHTING
" cd ~/.vim
" mkdir -p bundle && cd bundle
" git clone git://github.com/klen/python-mode.git

" pathogen plugin
" https://github.com/tpope/vim-pathogen
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set number
set ruler
set cursorline

" solarized
" http://ethanschoonover.com/solarized/vim-colors-solarized
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" python settings
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd Filetype python setlocal ts=4 sts=4 sw=4 noet
autocmd Filetype json setlocal ts=2 sts=2 sw=2 et
