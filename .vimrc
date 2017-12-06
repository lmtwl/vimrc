"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"filesystem
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'kien/ctrlp.vim' 

Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
  "let g:ycm_server_python_interpreter='/usr/bin/python3'
  set completeopt=longest,menu
  let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
  let g:ycm_cache_omnifunc=0  " 0 is disabled cache
  let g:ycm_seed_identifiers_with_syntax=1
  let g:ycm_collect_identifiers_from_comments_and_strings = 0
  let g:ycm_complete_in_comments = 1
  let g:ycm_complete_in_strings = 1
  let g:ycm_min_num_of_chars_for_completion=1
  let g:ycm_collect_identifiers_from_tags_files=1
Plugin 'scrooloose/nerdtree'

call vundle#end()

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za
"
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1
filetype plugin indent on 

set encoding=utf-8
syntax on


highlight Pmenu guibg=lightgrey ctermbg=lightgrey guifg=black ctermfg=black
highlight PmenuSel guibg=lightgrey ctermbg=blue guifg=blue ctermfg=black

au BufRead,BufNewFile *.py,*.pyw set shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.py,*.pyw set expandtab fileformat=unix
au BufRead,BufNewFile *.py,*.pyw set noautoindent textwidth=79
set nu

autocmd BufNewFile *.[ch],*.sh,*.py,*.html exec ":call SetTitle()"
func SetTitle()
	if &filetype == 'sh'
		call setline(1,"\#########################################################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: liming")
		call append(line(".")+2, "\# mail: liming@xunyou.com")
		call append(line(".")+3, "\# Created Time: ".strftime("%c"))
		call append(line(".")+4, "\#########################################################################")
		call append(line(".")+5, "\#!/bin/bash")
		call append(line(".")+6, "")
    elseif &filetype == 'python'
	    	call setline(1,"\##-*- coding:utf-8 -*-")
		call append(line("."),"\#########################################################################")
		call append(line(".")+1, "\# File Name: ".expand("%"))
		call append(line(".")+2, "\# Author: liming")
		call append(line(".")+3, "\# mail: liming@xunyou.com")
		call append(line(".")+4, "\# Created Time: ".strftime("%c"))
		call append(line(".")+5, "\#########################################################################")
		call append(line(".")+6, "\#!/usr/bin/env python")
		call append(line(".")+6, "")
    elseif &filetype == 'html'
		call setline(1, "<!DOCTYPE html>")
		call append(line("."), "<html lang=\"en\">")
		call append(line(".")+1, "<head>")
		call append(line(".")+2, "    <meta charset=\"UTF-8\">")
		call append(line(".")+3, "    <title></title>")
		call append(line(".")+4, "</head>")
		call append(line(".")+5, "<body>")
		call append(line(".")+6, "")
		call append(line(".")+7, "</body>")
		call append(line(".")+8, "</html>")
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author: liming")
		call append(line(".")+2, "	> Mail: liming@xunyou.com")
		call append(line(".")+3, "	> Created Time: ".strftime("%c"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
    if &filetype == 'html'
        normal Gkkk
    else
        normal G
    endif
endfunc
