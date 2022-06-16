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
set nocompatible modifiable

" Plugins
call plug#begin()

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rust
Plug 'rust-lang/rust.vim'

" Nim
Plug 'zah/nim.vim'

call plug#end()

" show emty/trailing EOL-whitespace
set ruler list listchars=tab:\ \ ,trail:.

" expand tabs to 4 spaces, set cursor correctly
set et sw=4 sts=4 backspace=indent,eol,start

" !INFO: this only works if `:set paste` is unset
set nopaste autoindent

" show numbers
set number

" Searching
set is hls

syntax enable
set background=dark
" colorscheme toast
" colorscheme desert
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" colorscheme badwolf

" this is for keeping my code in **shape**
set tw=92 cc=92

" hi Comment cterm=bold
hi Comment term=italic,bold cterm=italic,bold gui=italic,bold

" reverse visual mode colors
hi Visual gui=reverse term=reverse cterm=reverse

" print file content after editing
set t_ti= t_te= noeb vb t_vb= vb t_vb=

" Filetype Settings
filetype plugin indent on
" Go
if &filetype ==# 'go'
    set keywordprg=go\ doc
endif
if &filetype ==# 'c'
    " highlight Comment ctermfg=Green guifg=Green
endif

" Sadly Rust and Nim do not support text based docs
" which is really saddening
"

