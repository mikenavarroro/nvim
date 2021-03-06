syntax on

set number
set numberwidth=1
set rnu
set tabstop=2
set encoding=utf-8
set expandtab
set shiftwidth=2
set smartindent
set noshowmode
set cursorline
set mouse=a
set colorcolumn=81
set clipboard=unnamedplus
set updatetime=100
set hidden
set showtabline=2

let g:mapleader = ','

nnoremap <leader>q :q<CR>
nnoremap <leader>qq :q!<CR>

map <C-b> :NERDTreeToggle<CR>
map <C-n> :NERDTreeCWD<CR>ma
map <C-s> :w<CR>
map <C-g> :w<CR>:so %<CR>
map <C-h> :bprevious<CR>
map <C-l> :bnext<CR>

call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'thaerkh/vim-indentguides'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'mhinz/vim-startify'
Plug 'editorconfig/editorconfig-vim'
Plug 'kiteco/vim-plugin', {'as': 'vim-kite'}
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
autocmd BufNewFile,BufRead *.html inoremap < <><Esc>i

"Devicons
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:webdevicons_enable_startify = 1
let g:lightline#bufferline#enable_devicons = 1
let g:DevIconsEnableFoldersOpenClose = 1

"Dart
let g:lsc_auto_map = v:true
let g:dart_format_on_save = 1
let g:dart_style_guide = 2

"Nord
let g:nord_italic_comments = 1
let g:nord_italic = 1
let g:nord_underline = 1
colorscheme nord

"NERDTree
let g:NERDTreeShowHidden = 1

"Coc
inoremap <silent><expr> <C-SPACE> coc#refresh()

"kite
let g:kite_supported_languages = ['*']

"lightline
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ],
      \              [ 'kitestatus' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'Branch',
      \   'kitestatus': 'kite#statusline',
      \ },
      \ 'separator': {
      \   'left': '???',
      \   'right': '???'
      \ },
      \ 'subseparator': {
      \   'left': '???',
      \   'right': '???'
      \ },
      \ 'tab': {
      \   'active': [ 'filename', 'modified' ],
      \   'inactive': [ 'filename', 'modified' ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ [ 'close' ] ]
      \ },
      \ 'tabline_separator': {
      \   'left': '',
      \   'right': ''
      \ },
      \ 'tabline_subseparator': {
      \   'left': '|',
      \   'right': '|'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

function! Branch()
  return !empty(FugitiveHead())? '??? '.FugitiveHead() : FugitiveHead()
endfunction
