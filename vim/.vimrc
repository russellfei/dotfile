" Russell's vimrc file
"
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" DONE: Load plugins here (pathogen or vundle)
call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'shougo/unite.vim'
Plug 'shougo/vimfiler.vim'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'

Plug 'vim-airline/vim-airline'
Plug 'raimondi/delimitmate'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'derekwyatt/vim-fswitch'
" Track the engine.
Plug 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
call plug#end()

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" DONE: Pick a leader key
let mapleader = " "
nnoremap <leader>w :w<cr>
nnoremap <leader>q :quit<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>so :so %<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>

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
set guifont=

" Whitespace
set wrap
set textwidth=79
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
set foldenable
set foldmarker={,}
set foldmethod=marker
set foldcolumn=0

" Cursorline
set cursorline
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
set background=light "dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme desert
"colorscheme morning
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" --------------------------------------------------------------------------------
" Plugin settings
" --------------------------------------------------------------------------------
" LeaderF
let g:Lf_ShortcutF='<C-p>'
let g:Lf_DefaultExternalTool = 'pt'
nnoremap <leader>f :LeaderfFile<cr>
nnoremap <leader>fu :LeaderfFunction<cr>
nnoremap <leader>fa :LeaderfFunctionAll<cr>
nnoremap <leader>b :LeaderfBufferAll<cr>
nnoremap <leader>e :LeaderfFileFullScreen<cr>
nnoremap <leader>m :LeaderfMru<cr>
nnoremap <leader>l :LeaderfLineAll<cr>
nnoremap <leader>t :LeaderfTag<cr>
nnoremap <leader>cs :LeaderfColorscheme<cr>

" --------------------------------------------------------------------------------
" FSwitch
nnoremap <leader>fsh :FSHere<cr>

" --------------------------------------------------------------------------------
" Vimfiler
let g:vimfiler_as_default_explorer = 1
map <F3> :VimFilerExplore<CR>

" --------------------------------------------------------------------------------
" Tagbar
nmap <F2> :TagbarToggle<CR>
map <leader>t:!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
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
" Vim-Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"" --------------------------------------------------------------------------------
" delimitmate

" --------------------------------------------------------------------------------
" git-gutter
let g:gitgutter_async=1

" --------------------------------------------------------------------------------
" YCM config
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_confirm_extra_conf=0
let g:ycm_max_diagnostics_to_display=0
let g:ycm_autoclose_preview_window_after_completion = 1 
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
