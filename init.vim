call plug#begin('~/.config/nvim/plugged')

" Change Leader
let mapleader=','

" Basically this makes terminal Vim work sanely.
set backspace=2 " Make backspace work like most other apps
set notimeout   " Time out on key codes
set ttimeout    " Dont timeout on mappings
set ttimeoutlen=10
set noeb vb t_vb=

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" Text Preferences
set nowrap      " Dont wrap long lines
set linebreak   " Break by word at end of line when wrap=true
set showbreak=⇇ " Line break character
set list        " Show special characters
set listchars=tab:│\ ,extends:▸\,precedes:❮,trail:•

" Make vim more useful
set clipboard=unnamedplus,unnamed " Use system wide clipboard by default
set wildmenu              " Enhance command-line completion
set wildmode=list:full    " Show complete list of options and navigation too
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set binary                " Don’t add empty newlines at the end of files
set guicursor=            " Resolves bug of weird chars

" Disable backups and swap files
set noswapfile
set nobackup
set nowritebackup

set shortmess=at   " Don't show 'Hit ENTER to continue' message
set laststatus=2   " Always show status line (not needed when using airline)
set mouse=a        " Enable mouse in all modes
set noerrorbells   " Disable error bells
set nostartofline  " Don’t reset cursor to start of line when moving around.
set number         " Use normal numbers
set relativenumber " and relative line numbers
set autoread       " Automatically read a file when it is changed from the outside
set autowriteall   " Write all buffers
set lazyredraw     " Don't redraw while executing macros
set showcmd        " Show commands as you type them
set hidden         " allow unsaved changes to be hidden
set scrolloff=3    " Start scrolling three lines before the horizontal window border
set modeline       " enable modeline for per file configs


" General: ------------------------------------------------
Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with .

" Editing Plugins: ----------------------------------------
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tomtom/tcomment_vim'          " easy code commenting
Plug 'tpope/vim-surround'           " easy pair characters manipulation
Plug 'Lokaltog/vim-easymotion'      " jump, jump, jump around

" " Nvim Completion Manager: -----------------------------------
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
Plug 'ncm2/ncm2-bufword'


Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'leafOfTree/vim-vue-plugin'

Plug 'python-mode/python-mode'
let g:pymode_doc = 0
let g:pymode_doc_bind = ''
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_rope = 0
let g:pymode_lint_checkers = []
let g:pymode_run = 0
let g:pymode_options_max_line_length=120

let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_run_bind = '<leader>pr'

Plug 'posva/vim-vue'
Plug 'dense-analysis/ale'


" Treat .md files as Markdown
au BufNewFile,BufRead *.md setlocal filetype=markdown

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit'}

" let g:fzf_layout = { 'right': '~40%' }
nmap <c-p> :Files<cr>
nmap <c-s> :BTags<cr>

Plug 'scrooloose/nerdtree'
map <Leader>n :NERDTreeToggle<CR>
noremap <Leader>r :NERDTreeFind<CR>
let g:NERDTreeMapOpenVSplit='v'      " keep mappings between ctrlp and nerdtree concise
let NERDTreeIgnore=['\.pyc$', '\~$'] " Ignore irrelevant files like pyc and swap files
set guioptions-=L                    " Hide nerdtree's window scrollbar on macvim


syntax on " Enable syntax highligting
set cursorline             " Highlight current line
set noshowmode             " Remove second status bar when using powerline

Plug 'bling/vim-airline'          " vimscript airline, yay!
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1 " use powerline fonts
let g:airline_theme='tomorrow'    " nice theme

Plug 'csexton/trailertrash.vim' " Trailing whitespaces
map <Leader>tw :TrailerTrim<CR>
hi UnwantedTrailerTrash guibg=NONE ctermbg=NONE ctermfg=green guifg=green


set hlsearch   " Highlight searches
set ignorecase " Ignore case of searches
set incsearch  " Highlight dynamically as pattern is typed

" Map SPACE to remove search highlighting
noremap <silent> <space> :noh<cr>:call clearmatches()<cr>

Plug 'christoomey/vim-tmux-navigator' " seamless vim/tmux navigation
" Window Navigation:
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

Plug 'christoomey/vim-sort-motion'

Plug 'godlygeek/tabular'
map <Leader>t :Tabularize<CR>

nnoremap <Leader>w :w!<CR>

" Terminal Bubbling:-------------------
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv
vmap <C-h> <gv
vmap <C-l> >gv

" Paste and Indent
nnoremap <esc>p p'[v']=
nnoremap <esc>P P'[v']=

Plug 'nvie/vim-flake8'

call plug#end()               " any plugis should be before this
