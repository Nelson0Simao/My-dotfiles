" Data: 2025-01-20
" Exemplo do meu ~/.vimrc

" ============================
" CONFIGURAÇÃO BÁSICA
" ============================
set nocompatible              " Desabilita o modo compatível com vi
filetype indent plugin on
syntax on

" ============================
" OPÇÕES DE EDIÇÃO
" ============================
set ignorecase                " Ignora maiúsculas/minúsculas ao buscar
set smartcase                 " Mantém maiúsculas se houver na busca
set autoindent                " Mantém a indentação da linha anterior

" ============================
" EXIBIÇÃO
" ============================
set relativenumber            " Mostra números relativos
set number                    " Mostra números absolutos
set termguicolors             " Habilita suporte a cores verdadeiras
set background=dark           " Define tema escuro

" ============================
" TABULAÇÃO
" ============================
set tabstop=4                 " Define tabulação como 4 espaços
set shiftwidth=4              " Define recuo como 4 espaços
set softtabstop=4             " Mantém a tabulação alinhada
set expandtab                 " Converte tabs em espaços
set smarttab                  " Ajusta tabulação automaticamente

" ============================
" CLIPBOARD
" ============================
set clipboard=unnamedplus     " Usa clipboard do sistema

" ============================
" CONFIGURAÇÃO DE PLUGINS
" ============================
let g:copilot_enabled = 1     " Ativa GitHub Copilot
let NERDTreeShowHidden=1      " Exibe arquivos ocultos no NERDTree

" ============================
" MAPAS DE TECLAS
" ============================
" Atalhos úteis
nnoremap <C-s> :w<CR>         " Salva com Ctrl+S
nnoremap <C-q> :q<CR>         " Sai com Ctrl+Q
inoremap jj <Esc>             " Sai do modo inserção com 'jj'

" Indentação mantendo seleção
vnoremap < <gv                " Indenta para a esquerda
vnoremap > >gv                " Indenta para a direita

" Navegação no NERDTree
map <C-f> :NERDTreeToggle<CR>

" ============================
" MOVIMENTAÇÃO DE LINHAS
" ============================
" Mover linha atual
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==

" Mover bloco selecionado
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv

" Mover linhas com setas
nnoremap <C-Up> :m .-2<CR>==
nnoremap <C-Down> :m .+1<CR>==

vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv

" ============================
" GERENCIADOR DE PLUGINS (vim-plug)
" ============================
call plug#begin('~/.vim/plugged')

" Navegação de arquivos
Plug 'preservim/nerdtree'

" Statusline aprimorado
Plug 'vim-airline/vim-airline'

" Comentários rápidos
Plug 'tpope/vim-commentary'

call plug#end()

" ============================
" CONFIGURAÇÃO DO Coc.nvim (Comentado por enquanto)
" ============================
" let g:coc_global_extensions = [
"            \ 'coc-json',
"            \ 'coc-python',
"            \ 'coc-tsserver',
"            \ 'coc-html',
"            \ 'coc-css',
"            \ 'coc-java',
"            \ 'coc-sh',
"            \ 'coc-go',
"            \ 'coc-clangd'
"            \ ]

" Mapas para navegação no Coc
" nnoremap <silent> gd <Plug>(coc-definition) " Ir para definição
" nnoremap <silent> gr <Plug>(coc-references) " Referências
" nnoremap <silent> K :call CocActionAsync('doHover')<CR> " Documentação

" Completar ao pressionar <Tab>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

