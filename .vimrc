if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
	set fileencodings=utf-8,latin1
endif

filetype on
filetype plugin on

syn on
set ruler
set magic
set autoindent
set nocompatible
set backspace=indent,eol,start
set history=10000
set showmode
set showcmd
set showmatch
set nohlsearch
set mouse=
color desert
set fileformat=unix
hi Comment term=bold ctermfg=Red

if has("unix")
	let &shell="bash"
	set clipboard=autoselect
elseif has("linux")
	let &shell="bash"
	set clipboard=autoselect
endif

map Q :q
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq

vmap <TAB> >gv
vmap <S-TAB> <gv

function! Perl()
    set smartindent
    set noexpandtab
    set statusline+=%{perlbrew#statusline()}
endfunction

function! Python()
    set tabstop=4 
    set softtabstop=4
    set shiftwidth=4
    set smarttab 
    set expandtab
    set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
endfunction

function! Go()
    set tabstop=4 
    set softtabstop=4
    set shiftwidth=4
    set smarttab 
    set expandtab
endfunction

autocmd FileType perl call Perl()
autocmd FileType python call Python()
autocmd FileType go call Go()

au BufNewFile,BufRead *.snippets set noexpandtab
au BufNewFile,BufRead *.go set filetype=go

let delimitMate_matchpairs = "(:),[:],{:},<:>"

au FileType sh let b:is_bash=1
au FileType html,perl,bash,sh let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
