syntax enable "Enable syntax highlighting
set foldmethod=syntax
set noexpandtab " Don't convert tabs to spaces
if v:version > 703
	set number
endif
set relativenumber
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
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle config
Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}

Bundle 'git://git.wincent.com/command-t.git'
Bundle 'bitc/vim-hdevtools'

filetype plugin indent on

set laststatus=2
let skip_loading_mswin=1

set wildignore+=*.o,.git,CMakeFiles,CMakeCache.txt

let mapleader=","
let maplocalleader=";"

" Filetype autodetects
autocmd BufNewFile,BufRead *.cl setf opencl

" for gvim
if has('gui_running')
	set go-=f
	set go-=T
	set go-=r
	set go-=m
	set gfn=Inconsolata\ for\ Powerline\ 10
endif

" hotkey aliases
nnoremap <F9> :!make<cr>
nnoremap <F5> :YcmForceCompileAndDiagnostics<cr>

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
autocmd FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
autocmd FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
let g:syntastic_cpp_checkers=['ycm','gcc']
