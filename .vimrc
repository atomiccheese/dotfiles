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
filetype plugin on

" Filetype autodetects
au BufNewFile,BufRead *.cl setf opencl

" for gvim
if has('gui_running')
	set showtabline=2
	set gfn=ProggySquareTT\ 11
endif

" hotkey aliases
:nmap <F9> :!make<lf>
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" SuperTab configuration
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<c-g>'
let g:SuperTabMappingBackward = '<s-c-g>'
let g:SuperTabMappingTabLiteral = '<tab>'
