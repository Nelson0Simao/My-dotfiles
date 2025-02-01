" Exemplo de do meu ~/.vimrc
" Data: 2025-01-20

" Configuração básica para produtividade
let g:copilot_enabled = 1

set nocompatible              " Desabilita o modo compatível

filetype indent plugin on

syntax on

set ignorecase
set smartcase

set autoindent
set number                    " Exibe números de linha

set relativenumber            " Números relativos

set tabstop=4                 " Tamanho do tab em 4 espaços
set shiftwidth=4              " Recuo automático de 4 espaços
set softtabstop=4
set expandtab                 " Usa espaços ao invés de tabs
set smarttab

set clipboard=unnamedplus     " Habilita clipboard do sistema
set termguicolors             " Habilita cores verdadeiras

let NERDTreeShowHidden=1

" Mapas úteis
map <C-f> :NERDTreeToggle<CR>
nnoremap <C-s> :w<CR>         " Salva com Ctrl+S
nnoremap <C-q> :q<CR>         " Sai com Ctrl+Q
inoremap jj <Esc>             " Sai do modo inserção com jj
vnoremap < <gv                " Mantém seleção ao indentar à esquerda
vnoremap > >gv                " Mantém seleção ao indentar à direita

" Plugins com vim-plug
call plug#begin('~/.vim/plugged')

" Gerenciador de LSP
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Navegação de arquivos
Plug 'preservim/nerdtree'

" Statusline aprimorado
Plug 'vim-airline/vim-airline'

" Comentários rápidos
Plug 'tpope/vim-commentary'

call plug#end()
set background=dark



" Configuração do Coc.nvim
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
"   Mapas para navegação no Coc
"   nnoremap <silent> gd <Plug>(coc-definition) " Ir para definição
"   nnoremap <silent> gr <Plug>(coc-references) " Referências
"   nnoremap <silent> K :call CocActionAsync('doHover')<CR> " Documentação

" Completar ao pressionar <Tab>
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

