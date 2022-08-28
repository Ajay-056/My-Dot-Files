" Credits to: Neural Nine (https://github.com/NeuralNine/config-files) 

set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set clipboard=unnamedplus
set cursorline
set title
set wildmenu
set hidden
set completeopt=noinsert,menuone,noselect
set splitright
set ignorecase
set smartcase
set showmatch
set hlsearch
set ttyfast


filetype plugin indent on
syntax on


call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/glepnir/dashboard-nvim' " Dashboard when nv is opened without file
Plug 'https://github.com/dkarter/bullets.vim' " Auto bulletting & Numbering
Plug 'https://github.com/mbbill/undotree' " Undo Tree (Nvim First feature)
Plug 'https://github.com/jiangmiao/auto-pairs' " Automatic bracket close
Plug 'https://github.com/preservim/vim-markdown' " Markdown helper
Plug 'https://github.com/hrsh7th/nvim-cmp' " Autocompletion for nvim, LUA
Plug 'https://github.com/tpope/vim-fugitive' " Git commands inside nvim


set encoding=UTF-8

call plug#end()

" nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-q> :q!<CR>
nnoremap <C-w> :wq<CR>
nnoremap <F4> :bd<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>oggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
