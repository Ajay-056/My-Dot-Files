let g:auto_save=1
let g:auto_save_events=["InsertLeave","TextChanged"]
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
set termguicolors

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

Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status bar
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'dkarter/bullets.vim' " Auto bulletting & Numbering
Plug 'mbbill/undotree' " Undo Tree (Nvim First feature)
Plug 'jiangmiao/auto-pairs' " Automatic bracket close
Plug 'preservim/vim-markdown' " Markdown helper
Plug 'hrsh7th/nvim-cmp' " Autocompletion for nvim, LUA
Plug 'tpope/vim-fugitive' " Git commands inside nvim
Plug '907th/vim-auto-save' "auto saves files as you edit
Plug 'godlygeek/tabular' "Auto formatting
Plug 'nvim-lua/plenary.nvim' "  Required dependency for telescope 
Plug 'nvim-telescope/telescope.nvim' " Fuzzy Finder - which uses fd, ripgrep, 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " optional dependency for telescope
Plug 'farmergreg/vim-lastplace' " Continue from where you left last time
Plug 'luochen1990/rainbow' " Provides different colors to different paranthesis
Plug 'lambdalisue/battery.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'christoomey/vim-tmux-navigator'

" Plug 'tc50cal/vim-terminal' " Vim Terminal
" Plug 'glepnir/dashboard-nvim' " Dashboard when nv is opened without file

call plug#end()

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

" Airline and Neovim Theme

let g:alduin_Shout_Dragon_Aspect = 1
let g:alduin_Shout_Fire_Breath = 1
let g:airline_theme='deep_space'
" :colorscheme alduin 
:colorscheme deep-space 

" Nerd Tree Icons
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Airline Configuration
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z = 'L: %l/%L Col: %v'
" let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline_powerline_fonts = 1
let g:airline_stl_path_style = 'short'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#battery#enabled = 1
let g:bookmark_sign = '♥ ' 
let g:bookmark_auto_save = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

" Find files using Telescope (Fuzzy Finder)
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>s <cmd>source ~/.config/nvim/init.vim<cr>
