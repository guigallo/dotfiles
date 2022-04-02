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
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set wildignore+=**/.next/*
set nobackup
set nowritebackup
set shortmess+=c
set encoding=UTF-8

call plug#begin('~/.vim/plugged')
" theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/colorizer'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'airblade/vim-gitgutter'

" visual
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" coding
Plug 'tpope/vim-commentary'
Plug 'rstacruz/vim-closer'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'stylelint/stylelint'

" dont know
Plug 'nvim-lua/plenary.nvim'

" lsp plugins
Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/trouble.nvim'
call plug#end()

" themes
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='css,html,scss,js'
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
let g:NERDTreeGitStatusUseNerdFonts=1

function! FormatFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! FormatFile()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" remaps
let mapleader = " "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
nnoremap <C-b> :CtrlPBuffer<cr>
imap jk <Esc>
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" nerd tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" fugitive
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" gitgutter
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Vim Script
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

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
  autocmd
    \ BufNewFile,BufRead,BufEnter,BufLeave,WinEnter,WinLeave,WinNew
    \ *.css,*.scss
    \ ColorHighlight
  au FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"
augroup END

lua require('init')
