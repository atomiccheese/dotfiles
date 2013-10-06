set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
call pathogen#infect()

syntax enable "Enable syntax highlighting
set noexpandtab " Don't convert tabs to spaces
set number
set nuw=4
set nocompatible " Don't act compatible with vi
set incsearch " Enable incremental search
set autoindent " Enable automatic indenting
set hlsearch " Enable highlighting of search matches
set smartindent " Enable smart-starting of indentation when starting a block
set tabstop=8
set shiftwidth=8
set softtabstop=8
set tildeop " ~ can be used as an operator (invert case)
filetype plugin indent on

set wildignore+=*.o,.git,CMakeFiles,CMakeCache.txt


let mapleader=","
let maplocalleader=";"

" Filetype autodetects
autocmd BufNewFile,BufRead *.cl setf opencl

" for gvim
if has('gui_running')
	set showtabline=2
	set gfn=ProggySquareTT\ 11
endif

" hotkey aliases
nnoremap <F9> :!make<cr>
inoremap <C-V> <ESC><C-V>i
vnoremap <C-C> "+y

" Maps o to have special functionality when in a c/c++ file with
" a blank function with braces on the same line like this:
" void foo() {}
" to split the braces
function mine:FixBraces()
	if match(getline("."), '{\s*}') != -1
		execute "normal! ^f{di}i\<cr>\<tab>\<cr>\<esc>k$"
	else
		execute "normal! o\<esc>"
	endif
endfunction

autocmd FileType c,cpp nnoremap <buffer> <localleader>i :call mine:FixBraces()<cr>a

" path configuration
let protodefprotogetter="$HOME/.vim/bundle/vim-protodef/pullproto.pl"
