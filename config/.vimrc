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

set encoding=utf-8
set nocompatible modifiable
filetype plugin indent on

" Bend Config/RT Path
set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME,$XDG_CONFIG_HOME/vim/.vim,

call plug#begin('~/.config/vim/vimrc')
Plug 'ziglang/zig.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
call plug#end()

" Go
if &filetype ==# 'go'
    set keywordprg=go\ doc
endif

" show emty ws
set ruler list listchars=tab:\ \ ,trail:.

" Expanads tabs to 4 spaces
" And sets the cursors correctly
set et sw=4 sts=4
set backspace=indent,eol,start

" !INFO: this only works if `:set paste` is unset
set nopaste autoindent

" the only thing reliable
set number

" Searching
set is hls

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax enable
set background=dark
colorscheme gruvbox

let g:gruvbox_improved_strings=1

" this is for keeping my code in **shape**
set tw=92 cc=92
hi Comment term=bold cterm=bold gui=bold
hi Visual gui=reverse term=reverse cterm=reverse

" show title
set ttyfast
set title

" print file content after editing
set t_ti= t_te= noeb vb t_vb= vb t_vb=

" enable project based rcs
set exrc

" keep cursor position about where it was while scrolling
" up or down
set scrolloff=17

