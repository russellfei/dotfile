" Russell's vimrc file
"
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" DONE: Load plugins here (pathogen or vundle)
call plug#begin('~/.vim/plugged')

" Fzf plug via brew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" git notification for change
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" file browser
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" tagbar with universial-ctags 
Plug 'majutsushi/tagbar'
" header/src quick switcher
Plug 'derekwyatt/vim-fswitch'
" Commenter
Plug 'scrooloose/nerdcommenter'
" Auto close pair
Plug 'raimondi/delimitmate'
" Track the engine.
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

" Fancy mode line
Plug 'vim-airline/vim-airline'
" Atom One theme for Vim/NeoVim
Plug 'rakr/vim-one'

" Completion
" Plug 'justmao945/vim-clang'

call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" DONE: Pick a leader key
let mapleader = " "
" write and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>wq :wq<cr>
" buffer close
nnoremap <leader>bd :bd<cr>
" source/reload vimrc
nnoremap <leader>so :so ~/.vimrc<cr>
" buffer navigation
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
" white space clean up macro
nnoremap <leader>wc :%s/s+$//g<cr>

" Security
set modelines=0

" Show line numbers
set number 

" Show file stats
set ruler

" auto change dir
set autochdir

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8
set fileencodings=utf-8
set guifontset=
set guifont=Source\ Code\ Pro\ for\ powerline:h10

" Whitespace
set wrap
set textwidth=120
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" map <leader><space> :let @/=''<cr> " clear search

" Formatting
" convert multiple lines to extent of ruler
" ddd ss dd dd
" ff ee ss
" gg ess
" [gqip]
" --> ddd ss dd dd ff ee ss gg ess
"map <leader>q gqip

" Folding
"set foldenable
"set foldmarker={,}
"set foldmethod=marker
"set foldcolumn=0

" Cursorline
" set cursorline
" set cursorcolumn

" vim cmd autocomplete
set wildmenu

" cancel backup file
set nobackup

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>le :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:one_allow_italics = 1 " I love italic for comments

"if strftime('%H') >= 17
  "set background=dark
  "colorscheme one-dark
"else
  "set background=light
  "colorscheme one
"endif

set background=dark
colorscheme one

nnoremap <leader>bgl :set background=light<cr>:colorscheme one<cr>
nnoremap <leader>bgd :set background=dark<cr>:colorscheme one<cr>

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" --------------------------------------------------------------------------------
" Plugin settings
" --------------------------------------------------------------------------------
" FSwitch
nnoremap <leader>fsh :FSHere<cr>

" --------------------------------------------------------------------------------
" Tagbar
nmap <F2> :TagbarToggle<CR>
"map <leader>t :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" --------------------------------------------------------------------------------

" Window navigate
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" --------------------------------------------------------------------------------
" Window split
nmap <leader>h :split<CR>
nmap <leader>v :vsplit<CR>

" --------------------------------------------------------------------------------
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
set shell=bash
nnoremap <F3> :RangerCurrentDirectoryNewTab<cr>

" --------------------------------------------------------------------------------
" Vim-Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='one'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"" --------------------------------------------------------------------------------
" delimitmate

" --------------------------------------------------------------------------------
" git-gutter
let g:gitgutter_async=1

" --------------------------------------------------------------------------------
" Ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" --------------------------------------------------------------------------------
" vim-clang
" let g:clang_c_options='-std=gnu11'
" let g:clang_cpp_options='-std=c++11 -stdlib=libc++'
" use compile commands
" let g:clang_compilation_database='./build'

