au VimLeave,VimSuspend * set guicursor=a:ver90

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
set completeopt=menuone,noinsert

set cmdheight=1
set updatetime=50

call plug#begin('~/.vim/plugged')

" Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Color Schemes
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'

" Syntax Highlighting and more
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Git integrations
Plug 'tpope/vim-fugitive'

" Undo trees
Plug 'mbbill/undotree'

" icons
Plug 'kyazdani42/nvim-web-devicons'

" Statusline
Plug 'famiu/feline.nvim'


call plug#end()

lua require("configs")
lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}


colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

inoremap <C-c> <esc>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup DISHANK
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
