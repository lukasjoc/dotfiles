" Lightweight Vim config -----------------------------------------------------------------
" Tested on:
" VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Apr 06 2022 16:59:21)
" macOS version - arm64
" Included patches: 1-4700
"
"	        ////
"	 _(\   \|@@|/
"	(__/\__\\--// __
"	   \___|----|  | __VIM man says:
"	                        `It would be best to flush`
"
" ----------------------------------------------------------------------------------------

set encoding=utf-8
set nocompatible modifiable
filetype plugin indent on

" Bend Config/RT Path

call plug#begin('~/.config/vim/vimrc')
" Plug 'ziglang/zig.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
" Plug 'lukasjoc/vim-colors'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'

" Plug 'yggdroot/indentline'
call plug#end()

set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ }

" Go
if &filetype ==# 'go'
    set keywordprg=go\ doc
endif

" show emty ws
set ruler list listchars=tab:\ \ ,trail:.

set et sw=4 sts=4
set backspace=indent,eol,start

" !INFO: this only works if `:set paste` is unset
set nopaste autoindent

" the only thing reliableG
set number

" Searching
set is hls

" Syntax + Colors ------------------------------------------------------------------------
" " Maintainer:  Brian Nelson <nelsonbc@gmail.com>,lukasjoc <lukasjoc@gmail.com>
" " Last Change: $Revision: 2.0 $ $Date: 2022/08/21 13:10 $
" "
" " Less is More - A minimal color scheme.
" " Disigned to work equally well on 8 or 16 colors, terminal or GUI.
if exists("syntax_on")
    syntax reset
endif

set background=dark

hi clear
hi Normal         term=none ctermfg=7 ctermbg=0 gui=none guifg=LightGray guibg=black
hi Directory      term=bold cterm=bold ctermfg=blue guifg=Cyan
hi Search         term=reverse ctermfg=white  ctermbg=blue guifg=white guibg=Blue
hi MoreMsg        term=bold cterm=bold ctermfg=darkgreen gui=bold guifg=DarkGreen
hi ModeMsg        term=bold cterm=bold gui=bold guifg=White guibg=Blue
hi LineNr         term=underline cterm=none ctermfg=cyan guifg=Cyan
hi Question       term=standout cterm=bold ctermfg=darkgreen gui=bold guifg=DarkGreen
hi Comment        term=bold cterm=bold ctermfg=3 gui=none guifg=Pink
hi Constant       term=bold cterm=none ctermfg=7 gui=none guifg=Orange
hi Special        term=bold cterm=none ctermfg=3 gui=none guifg=Orange
hi Identifier     term=none cterm=none ctermfg=7 gui=none guifg=Cyan
hi PreProc        term=underline cterm=bold ctermfg=7 gui=bold guifg=Cyan
hi Error          term=reverse cterm=bold ctermfg=7 ctermbg=1 gui=bold guifg=Black guibg=Red
hi Todo           term=standout cterm=none ctermfg=0 ctermbg=7 guifg=Black guibg=White
hi String         term=none cterm=none ctermfg=3 gui=none guifg=LightYellow
hi Function       term=none cterm=none ctermfg=3 gui=none guifg=Orange
hi Statement      term=none cterm=none ctermfg=7 gui=bold guifg=White
hi Include        term=none cterm=none ctermfg=4 gui=none guifg=LightBlue
hi StorageClass   term=none cterm=none ctermfg=5 gui=none guifg=LightMagenta
hi Type           term=bold cterm=bold ctermfg=7 gui=none guifg=Orange
hi Defined        term=none cterm=none ctermfg=6 gui=none guifg=LightCyan
hi link Character       String
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Macro           Include
hi link PreCondit       PreProc
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special

" Custom Stuffs (Overwrite)
hi Comment term=bold cterm=bold gui=bold
hi Visual gui=reverse term=reverse cterm=reverse
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" ----------------------------------------------------------------------------------------

" this is for keeping my code in **shape**
set tw=92 cc=92

" show title
set ttyfast
set title

" print file content after editing
set t_ti= t_te= noeb vb t_vb= vb t_vb=

" enable project based rcs
set exrc

" keep cursor position about where it was while scrolling
" up or down
set scrolloff=21

