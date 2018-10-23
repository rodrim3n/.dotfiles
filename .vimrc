" Plog Init: ------------------------------------------------------------------{{{
set nocompatible    " be iMproved, required
filetype off        " required

call plug#begin('~/.vim/plugged')

" Change Leader
let mapleader=','
let maplocalleader='\'

" Basically this makes terminal Vim work sanely.
set backspace=2 " Make backspace work like most other apps
set notimeout   " Time out on key codes
set ttimeout    " Dont timeout on mappings
set ttimeoutlen=10
set noeb vb t_vb=

" Text Preferences
set nowrap      " Dont wrap long lines
set linebreak   " Break by word at end of line when wrap=true
set showbreak=⇇ " Line break character
set list        " Show special characters
set listchars=tab:│\ ,extends:▸\,precedes:❮,trail:•
" alternate tab ❯

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

Plug 'editorconfig/editorconfig-vim' " http://editorconfig.org/

" General: ------------------------------------------------

Plug 'tpope/vim-repeat' " enable repeating supported plugin maps with .
Plug 'tpope/vim-eunuch' " nice UNIX helpers like SudoWrite, etc

" Tags
Plug 'ludovicchabant/vim-gutentags'
nnoremap <C-s> :BTags<CR>


" Editing Plugins: ----------------------------------------
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tomtom/tcomment_vim'          " easy code commenting
Plug 'tpope/vim-surround'           " easy pair characters manipulation
Plug 'jiangmiao/auto-pairs'         " easy quoting, etc. ie: insert ' -> ''; [ -> []
Plug 'Lokaltog/vim-easymotion'      " jump, jump, jump around
Plug 'terryma/vim-multiple-cursors' " sublime multi cursors wannabe
Plug 'tmhedberg/matchit'              " match tags :)
" Faster matching
nmap <Tab> %
vmap <Tab> %

" Text Objects: --------------------------------------------
Plug 'https://github.com/kana/vim-textobj-user/'         " text object plugin, add abstraction layer for other plugins
Plug 'https://github.com/nelstrom/vim-textobj-rubyblock' " adds {ar/ir} text objects
Plug 'https://github.com/akiyan/vim-textobj-php'         " adds {aP/iP}
Plug 'https://github.com/bps/vim-textobj-python'         " adds {]pf/[pf} and {[pc/]pc} motions previos/next function/class
" adds {af/if} and  {ac/ic} function/class


" Neocomplete: --------------------------------------------
Plug 'Shougo/vimproc.vim', {'do': 'make'} " enable async stuff for Shougo's plugins
" enable context_filetype

Plug 'Konfekt/FastFold'
Plug 'Shougo/context_filetype.vim'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1
" Plug 'Shougo/neocomplete.vim'
" let g:neocomplete#enable_at_startup = 1

" " Nvim Completion Manager: -----------------------------------
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

" NeoSnippets: -----------------------------------------------{{{
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" Plug key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" add custom snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets'

" open snippets dir
map <Leader>h :vsp ~/.vim/plugged/vim-snippets/snippets/<CR>
"}}}

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"}}}--------------------[ end Various Bundles  ]----------------------------------------

" Python:---------------------------------------------------------------{{{
Plug 'klen/python-mode'
let g:pymode_doc = 0
let g:pymode_doc_bind = ''
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_on_fly = 0
let g:pymode_rope = 0
let g:pymode_lint_checkers = []
let g:pymode_run = 0

let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_run_bind = '<leader>pr'
nnoremap <Leader>pl :PymodeLintAuto<CR>

Plug 'farfanoide/vim-kivy'

"}}}--------------------[ end Python ]----------------------------------------


" Syntax Plugins:--------------------------------------------------{{{
Plug 'vim-scripts/rtorrent-syntax-file' " rtorrent conf files support
Plug 'tejr/vim-tmux'                    " tmux conf files support
Plug 'vim-scripts/bats.vim'             " Bats support
" Plug 'markcornick/vim-bats'             " Bats support
Plug 'plasticboy/vim-markdown'          " Markdown support
Plug 'jceb/vim-orgmode'                 " OrgMode support
Plug 'tpope/vim-speeddating'            " Required by vim-orgmode
Plug 'elixir-lang/vim-elixir'           " Elixir support
Plug 'posva/vim-vue'

Plug 'scrooloose/syntastic' " Syntax check

" Org files
au BufNewFile,BufRead *.org setlocal filetype=org
" Treat .md files as Markdown
au BufNewFile,BufRead *.md setlocal filetype=markdown
"}}}

" Files:---------------------------------------------------------------{{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit'}

" let g:fzf_layout = { 'right': '~40%' }
nmap <c-p> :Files<cr>


Plug 'scrooloose/nerdtree'

" Show/Hide NerdTree
map <Leader>n :NERDTreeToggle<CR>
" Find current buffer in nerdtree
noremap <Leader>r :NERDTreeFind<CR>
let g:NERDTreeMapOpenVSplit='v'      " keep mappings between ctrlp and nerdtree concise
let NERDTreeIgnore=['\.pyc$', '\~$'] " Ignore irrelevant files like pyc and swap files
set guioptions-=L                    " Hide nerdtree's window scrollbar on macvim

Plug 'jistr/vim-nerdtree-tabs'
" Replace previous options with yet another plugn:
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_focus_on_files=1


"}}}--------------------[ end Files  ]----------------------------------------
" Eye Candy:---------------------------------------------------------------{{{
" --------------[Themes]-----------------------------------------------------"{{{
Plug 'junegunn/seoul256.vim'
Plug 'farfanoide/vim-facebook'
Plug 'w0ng/vim-hybrid'
Plug 'baskerville/bubblegum'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'jpo/vim-railscasts-theme'
Plug '29decibel/codeschool-vim-theme'
Plug 'vim-scripts/apprentice.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'AlxHnr/clear_colors'
Plug 'daylerees/colour-schemes', { 'rtp': 'vim/' }
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim/' }


"}}}

syntax on " Enable syntax highligting


" don't try to highlight lines longer than 130 characters. (life saving!)
if has('gui_running')
  set synmaxcol=200
  if has("gui_gtk2")
    set guifont=Nimbus\ Mono\ L\ Bold\ 10
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h13
  endif
else
  set synmaxcol=130
endif

set t_Co=256               " Use 256 colours (Use this setting only if your terminal supports 256 colours)
set cursorline             " Highlight current line
set noshowmode             " Remove second status bar when using powerline

" --------------[Powerline]--------------------------------------------------
Plug 'bling/vim-airline'          " vimscript airline, yay!
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1 " use powerline fonts
let g:airline_theme='tomorrow'    " nice theme

if has('gui_running')
  let g:airline_powerline_fonts = 0 " dont use powerline fonts
  let g:airline_left_sep=' '
  let g:airline_right_sep=' '
endif

set guioptions-=T " Dont show toolbar on gui
" highlight just the 120th column of wide lines...
highlight ColorColumn ctermbg=white ctermfg=red
call matchadd('ColorColumn', '\%120v', 100)



Plug 'csexton/trailertrash.vim' " Trailing whitespaces
map <Leader>tw :TrailerTrim<CR>
hi UnwantedTrailerTrash guibg=NONE ctermbg=NONE ctermfg=green guifg=green


" Search:---------------------------------------------------------------{{{

set hlsearch   " Highlight searches
set ignorecase " Ignore case of searches
set incsearch  " Highlight dynamically as pattern is typed
set gdefault   " Add the g flag to search/replace by default

" Map SPACE to remove search highlighting
noremap <silent> <space> :noh<cr>:call clearmatches()<cr>

"}}}--------------------[ end Search  ]------------------------------------

" Windows Tabs:-----------------------------{{{
set title " Show the filename in the window titlebar

" sane splitting
set splitbelow            " hsplits below by default
set splitright            " vsplits right by default
" au VimResized * :wincmd = " Resize splits when the window is resized


Plug 'christoomey/vim-tmux-navigator' " seamless vim/tmux navigation
" Window Navigation:
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" }}}
" Code Formatting:---------------------------------------------------------------{{{

Plug 'christoomey/vim-sort-motion'

" format paragraph and restor cursor position
map <Leader>fp gwap


Plug 'godlygeek/tabular'
map <Leader>t :Tabularize<CR>

"}}}--------------------[ end Code Formatting  ]----------------------------------------

" Faster Commands:---------------------------------------------------------------{{{

" Faster save
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>tn :tabnew<CR>

" Escape with jj
inoremap jj <ESC>

" change cursor position in insert mode
inoremap <C-l> <right>
inoremap <C-h> <left>

" Join upper line at the end of current one
nnoremap <leader>j ddkOpJ


"}}}--------------------[ end Faster Commands ]----------------------------------------

" Indentation:------------------------------------{{{

" Smart indentation of new lines
set autoindent
set smartindent


" Tab expansion settings
let tabsize = 2
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set expandtab " Use spaces instead of tabs


Plug 'tpope/vim-unimpaired' " Some nice text object manipulation mappings

" Terminal Bubbling:-------------------
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv
vmap <C-h> <gv
vmap <C-l> >gv

" Paste and Indent
nnoremap <esc>p p'[v']=
nnoremap <esc>P P'[v']=

" Indent entire document
function! s:IndentBuffer()
  silent! execute 'normal! gg=G``'
endfunction
command! -range=% IndentBuffer call <SID>IndentBuffer()
nnoremap <leader>i :normal! gg=G``<CR>

function! SetTabSize(size)
  execute "set tabstop=".a:size
  execute "set shiftwidth=".a:size
  execute "set softtabstop=".a:size
endfunction
command! -nargs=1 SetTabSize call SetTabSize(<f-args>)

" }}}

" Folding: ------------------------------------------{{{
set foldenable
set foldmethod=marker
set foldlevelstart=0

" Toggle folds
nnoremap <Leader><Space> za
vnoremap <Leader><Space> za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO
" fold tag
nnoremap <leader>ft Vatzf
" }}}

"Miscellaneous:---------------------------------------------------------------{{{

Plug 'nvie/vim-flake8'

noremap <s-k> <Nop>

function! Delegate(command)
  let l:save_cursor = getpos(".")
  execute a:command
  call setpos('.', l:save_cursor)
endfunction

" AutoCommands: " Auto-reload vimrc on save
if has("autocmd")
  autocmd! bufwritepost $MYVIMRC source $MYVIMRC
endif
nmap <Leader>v :vsp $MYVIMRC<CR>

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
let g:goyo_width = 120


"}}}--------------------[ end Miscellaneous  ]----------------------------------------
" Plug End: ------------------------------------------------------------------{{{


call plug#end()               " any plugis should be before this
filetype plugin indent on     " required
colorscheme Tomorrow-Night " This changes a lot
" no background for those vertical splits, they look ugly
hi VertSplit guibg=NONE ctermbg=NONE gui=NONE

" dont comment out next line (dont know why this must go last)
autocmd FileType * setlocal formatoptions-=o formatoptions-=r

autocmd BufWritePost *.py call Flake8()
"}}}
