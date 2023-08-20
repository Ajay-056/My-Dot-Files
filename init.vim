" Credits to: Neural Nine (https://github.com/NeuralNine/config-files) 
" Credids to: Chris Titus Tech

"Nvim option reference: https://neovim.io/doc/user/quickref.html#quickref

" Instructions before creating config file

" 1. Neovim must be installed
" 2. (Linux) Navigate to the folder ~/.config and create a folder named "nvim", inside nvim folder create a file named "init.vim"
" 3. (Windows) C:\Users\${Username}\AppData\Local\nvim\init.vim
" 4. Download vim plug using the steps - https://github.com/junegunn/vim-plug#unix-linux
" 5. Copy and modify the config (If needed), save and close the file
" 6. Relaunch neovim again and issue ":PlugInstall" to install the pluggins used in this config file
" 7. Ready to rock 🚀🚀

let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let mapleader=" " "Maps Leader to space
let NERDTreeShowHidden=1

set encoding=utf-8
set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set mouse=a
set clipboard=unnamedplus
set title
set wildmenu
set completeopt=noinsert,menuone,noselect
set splitright
set ignorecase
set smartcase
set showmatch
set hlsearch
set wrap
set noswapfile
set nobackup
set history=5000

filetype plugin indent on
syntax on

" set cursorline
" set spell spelllang=en_us
" set wildmode=longest,list,full
" set incsearch
" set ttyfast
" set smarttab
" set softtabstop=2
" set expandtab
" set hidden

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/glepnir/dashboard-nvim' " Dashboard when nv is opened without file
Plug 'https://github.com/dkarter/bullets.vim' " Auto bulletting & Numbering
Plug 'https://github.com/mbbill/undotree' " Undo Tree (Nvim First feature)
Plug 'https://github.com/jiangmiao/auto-pairs' " Automatic bracket close
Plug 'https://github.com/preservim/vim-markdown' " Markdown helper
Plug 'https://github.com/hrsh7th/nvim-cmp' " Autocompletion for nvim, LUA
Plug 'https://github.com/tpope/vim-fugitive' " Git commands inside nvim
Plug '907th/vim-auto-save' "auto saves files as you edit
Plug 'godlygeek/tabular' "Auto formatting
Plug 'nvim-lua/plenary.nvim' "  Required dependency for telescope 
Plug 'nvim-telescope/telescope.nvim' " Fuzzy Finder - which uses fd, ripgrep, 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " optional dependency for telescope

" Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal


call plug#end()

" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <F4> :bd<CR>
map <Leader>n :NERDTreeToggle<CR>
nnoremap <C-q> :q!<CR>
nnoremap <C-w> :wq<CR>
nnoremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

" Tabedit keybinds
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>w :tabclose<CR>

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

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
