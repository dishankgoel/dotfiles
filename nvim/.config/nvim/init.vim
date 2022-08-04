au VimLeave,VimSuspend * set guicursor=a:ver90

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set relativenumber
set nu
set nowrap
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
set inccommand=nosplit

set cmdheight=1
set updatetime=50

call plug#begin('~/.vim/plugged')

" Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Install nvim-cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

" Tabnine for code intelligence
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

Plug 'onsails/lspkind-nvim'

" Install snippet engine (This example installs [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip))
" Plug 'hrsh7th/vim-vsnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Install the buffer completion source
Plug 'hrsh7th/cmp-buffer'

" Color Schemes
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'

" Syntax Highlighting and more
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Git integrations
Plug 'tpope/vim-fugitive'

" Undo trees
Plug 'mbbill/undotree'

" Formatting
Plug 'sbdchd/neoformat'

" icons
Plug 'kyazdani42/nvim-web-devicons'

" Statusline
Plug 'famiu/feline.nvim'

Plug 'lewis6991/gitsigns.nvim'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Comments
Plug 'b3nj5m1n/kommentary'

" Helm
Plug 'towolf/vim-helm'

call plug#end()

lua require("configs")
lua <<EOF
require'nvim-treesitter.configs'.setup { indent = { enable = false }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}
require('kommentary.config').use_extended_mappings()
EOF

let g:mkdp_auto_close = 0


colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG<C-o>

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>pv :Ex<CR>

inoremap <C-c> <esc>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" augroup DISHANK
"     autocmd!
"     autocmd BufWritePre * :call TrimWhitespace()
" augroup END

augroup FileTypeSettingsTerraform
    autocmd!
    autocmd BufEnter *.tf,*.tfvars silent! lua vim.opt_local.filetype = 'terraform'
augroup END

augroup FileTypeSettingsHelm
    autocmd!
    autocmd BufEnter *.tpl silent! lua vim.opt_local.filetype = 'helm'
augroup END

autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
