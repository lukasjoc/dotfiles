" Lightweight (and (maybe)finally maintainable) `vim` config
" Tested on:
" VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Jan 01 1980 00:00:00)
" macOS version
" Included patches: 1-850, 1972
"	         __A
"	 _(\    |@@|
"	(__/\__ \--/ __
"	   \___|----|  |   `__VIM  man says
"	                   it would be best to flush`
""

set nocompatible
filetype plugin indent on

" show emty ws
set ruler list listchars=tab:\ \ ,trail:.

" ?? Seems imprtant
set backspace=indent,eol,start

" Settings for weird filetypes vim does not understand by default
augroup filetypedetect
    au BufRead,BufNewFile *.vue setfiletype html
augroup END

" Indent will be 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

" !INFO: this only works if `:set paste` is unset
set autoindent

" AI AND CRYPTO powered with QUANTUM Genetics
" But written with Rust
set ai

" the only thing reliable
set number

" searching
set incsearch
set hlsearch

syntax enable
colorscheme torte

" this is fore keeping my code in **shape**
set textwidth=92
set colorcolumn=92

" reverse visual mode colors
hi Visual term=reverse cterm=reverse

" print file content after editing
set t_ti= t_te=

" bells no
set noeb vb t_vb=
set vb t_vb=

