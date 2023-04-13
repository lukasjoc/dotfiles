set encoding=utf-8
set nocompatible modifiable
filetype plugin indent on

set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux
set ruler list listchars=tab:\ \ ,trail:.

set et sw=4 sts=4
set backspace=indent,eol,start
set nopaste autoindent
set is hls
if exists("syntax_on")
    syntax reset
endif
set background=dark
colorscheme desert

set textwidth=92
set colorcolumn=92
hi ColorColumn term=bold cterm=bold ctermbg=16 gui=bold guibg=#bbbbbb
set foldcolumn=2
hi FoldColumn term=none gui=none ctermfg=0 ctermbg=0 guifg=Black guibg=#121212
set ttyfast
set title
set scrolloff=21
nnoremap <C-L> :nohl<CR><C-L>
if has("gui_macvim")
    set foldcolumn=0
endif

