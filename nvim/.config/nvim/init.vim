syntax on

set exrc
set nocompatible
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
" set noswapfile
" set nobackup
set undodir=~/.vim/undodir
set undofile
set smartcase
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set cmdheight=2
set updatetime=50
set wildmode=longest,list,full
set wildmenu
set wildignore=*/node_modules/*,*/.next/*
set nobackup
set nowritebackup
set shortmess+=c

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'rstacruz/vim-closer'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'stylelint/stylelint'
call plug#end()

" themes
colorscheme gruvbox
highlight Normal guibg=NONE ctermbg=NONE
" highlight ColorColumn guibg=#282a36
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['gitbranch', 'readyonly', 'filename', 'modified'] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ }
  \ }

" maps
let mapleader = " "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
nnoremap <C-b> :CtrlPBuffer<cr>
imap jk <Esc>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" javascript
let g:javascript_plugin_jsdoc = 1

" auto commands
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup GUIGALLO
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
  autocmd FileType javascript setlocal foldmethod=syntax
augroup END
