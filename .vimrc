" Configura o encoding
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
	set fileencodings=utf-8,latin1
endif

" Carrega os plugins automaticamente
filetype on
filetype plugin on

syn on " Deixa o vim colorido
set ruler " Mostra a posisao do cursor
set autoindent " Identacao automatica
set nocompatible " Permite uso do backspace
set backspace=indent,eol,start "Usando <Backspace> para deletar linha
set history=10000 " Define o tamanho do arquivo de historico
set showmode " Mostra o modo em que estamos
set showcmd  " Mostra os comandos sendo executados
set showmatch " Avisa quando parenteses/chaves/colchetes nao foram fechados
set nohlsearch " Desativa o recurso de cores em pesquisa de palavras
set mouse= " Configura o mouse para usar command-line em vez de visual
color desert " Configura a cor para desert
set fileformat=unix " Os arquivos serao sempre salvos como unix

" Paste mode. Isto e util se voce quer copiar e colar algum texto de alguma
" janela e cola-lo no vim. Isto ira evitar efeitos inesperados
set pastetoggle=<C-S-p>

" Se o sistema for unix, muda o terminal para bash
if has("unix")
	let &shell="bash"
	set clipboard=autoselect
elseif has("linux")
	let &shell="bash"
	set clipboard=autoselect
endif

" Arquivos .sh sao sempre bash, e nao sh
au FileType sh let b:is_bash=1

" Mostra em vermelho os espacos redundantes
highlight RedundantWhitespace ctermbg=red guibg=red

" Pressione F4 para transformar o codigo em html
map <F4> :runtime! syntax/2html.vim<CR>

" Remove ^M do arquivo
map <F5> <ESC>:%s///g<CR>

" Remove espacos do inicio das linhas
map <F6> <ESC>:%s/^ *//g<CR>

" Remove espacos do fim das linhas
map <F7> <ESC>:%s/ *$//g<CR>

" Remove espacos redundantes do texto
map <F8> <ESC>:%s/  / /g<CR>

" Permite remover e adicionar o numero de linhas
map _n :set invnumber<CR>

" Mapeia Q para :q
map Q :q

" Ajusta comandos de saida quando voce digita em maiusculo
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq

" Comenta/Descomenta blocos de codigo
vmap _c : s/^/#/g<CR>
vmap _C : s/^#//g<CR>
nmap _c : s/^/#/g<CR>
nmap _C : s/^#//g<CR>

" Faz o <tab> em modo visual identar o codigo
vmap <TAB> >gv
vmap <S-TAB> <gv

" Muda a cor do background de escuro para claro
map <silent> <C-x> :let &background = ( &background == "dark"?"light" : "dark" )<CR>

" perl
function! Perl()

    " Identacao inteligente
    set smartindent
    " Em perl usa-se tab de verdade e nao espacos
    set noexpandtab

    " Habilita o modulo do perlbrew
    set statusline+=%{perlbrew#statusline()}

endfunction

" Python
function! Python()

    "configura o tab com 4 espacos
    set tabstop=4 
    "numeros de espacos usados no tab
    set softtabstop=4
    "numero de espacos usados para (auto)indent
    set shiftwidth=4
    "trabalha em conjunto com shiftwidth, tabstop e softtabstop.
    set smarttab 
    "Idem a opcao anterior
    set expandtab
    "identacao inteligente para comandos python
    set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

endfunction

" Carrega as funcoes de perl e python
autocmd FileType perl call Perl()
autocmd FileType python call Python()

" Configuracoes do snippets
au BufNewFile,BufRead *.snippets set noexpandtab

" Carrega os delimitadores para os arquivos abaixo
let delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType html,perl,bash,sh let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
