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
set completeopt=menuone,noinsert,noselect,preview
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
set encoding=UTF-8

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
" Plug 'sheerun/vim-polyglot'
Plug 'rstacruz/vim-closer'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'stylelint/stylelint'

Plug 'pangloss/vim-javascript'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'runoshun/tscompletejob'
Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'

Plug 'ryanoasis/vim-devicons'

call plug#end()

" themes
set guifont=FiraCode\ Nerd\ Font\ 11
colorscheme dracula
highlight Normal guibg=NONE ctermbg=NONE
let g:webdevicons_enable = 1
let g:webdevicons_enable_ctrlp = 1
let g:lightline = {
  \ 'colorscheme': 'dracula',
  \ 'active': {
  \   'left': [ ['mode', 'paste'],
  \             ['gitbranch', 'readyonly', 'filename', 'modified'] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'filetype': 'FormatFileType',
  \   'fileformat': 'FormatFile',
  \ }
  \ }

function! FormatFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! FormatFile()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" maps
let mapleader = " "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
nnoremap <C-b> :CtrlPBuffer<cr>
imap jk <Esc>

" javascript
let g:javascript_plugin_jsdoc = 1

" fugitive
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" gitgutter
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)

" lsp
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'javascript support using typescript-language-server',
    \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
    \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx', 'javascriptreact']
    \ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  inoremap <buffer> <expr><c-f> lsp#scroll(+4)
  inoremap <buffer> <expr><c-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.ts,*.js,*.scss call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" asyncomplete
call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
  \ 'name': 'tscompletejob',
  \ 'allowlist': ['typescript', 'javascript'],
  \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
  \ }))

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
let g:asyncomplete_auto_popup = 1

" auto commands
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup GUIGALLO
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
  autocmd FileType javascript,typescript setlocal foldmethod=syntax
  au FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"
augroup END
