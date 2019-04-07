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
" powerful git flow
Plug 'tpope/vim-fugitive'

if has('gui_running')
  " File Tree like NERDTree
  Plug 'tpope/vim-vinegar'
else
  " ranger file system
  Plug 'francoiscabrol/ranger.vim'
  if has('nvim')
    Plug 'rbgrouleff/bclose.vim'
  endif
endif

" git notification for change
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'

" tagbar with universial-ctags 
Plug 'majutsushi/tagbar'
" code completion, search for alternatives
Plug 'Valloric/YouCompleteMe'
" header/src quick switcher
Plug 'derekwyatt/vim-fswitch'
" Commenter
Plug 'scrooloose/nerdcommenter'
" Auto close pair
Plug 'raimondi/delimitmate'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Fancy mode line
Plug 'vim-airline/vim-airline'
" Atom One theme for Vim/NeoVim
Plug 'rakr/vim-one'

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
set guifont=Source\ Code\ Pro\ for\ Powerline:h12

" Whitespace
set wrap
set textwidth=119
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
map <leader><space> :let @/=''<cr> " clear search

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

set background=light
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
map <leader>t :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
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
" FileTree settings
if has('gui_macvim')
  let g:netrw_liststyle = 1
  let g:netwr_browse_split = 4
  let g:netrw_altv = 1
  let g:netrw_winsize = 25
  let g:netrw_banner = 0
  let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
else
  let g:loaded_netrwPlugin = 1
  let g:ranger_replace_netrw = 1
  let g:ranger_map_keys = 0
  nnoremap <F3> :RangerCurrentDirectoryNewTab<cr>
endif

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
" YCM config
set completeopt=longest,menu
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_confirm_extra_conf=0
let g:ycm_max_diagnostics_to_display=0

let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1 
let g:ycm_autoclose_preview_window_after_insertion = 1

nnoremap <F5>           :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gi     :YcmCompleter GoToInclude<CR>
nnoremap <leader>gd     :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf     :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gip    :YcmCompleter GoToImprecise<CR>
nnoremap <leader>fx     :YcmCompleter FixIt<CR>

" --------------------------------------------------------------------------------
" Ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

