" ============================================================================
" Vundle init and config
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-abolish'
Plugin 'tmhedberg/matchit'
Plugin 'henrik/vim-indexed-search'
Plugin 'vim-scripts/Align'
Plugin 'lrvick/Conque-Shell'
Plugin 'elzr/vim-json'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ============================================================================
" Airline config
"

" show fancy symbols in the airline status bar
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" old vim-powerline symbols
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" required so the status bar actually shows
set laststatus=2

" ============================================================================
" Unite config
"

nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>
nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>

" CtrlP search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec','sorters','sorter_rank')

" replacing unite with ctrl-p
nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>

nnoremap <Leader>f :Unite -no-quit grep:.<cr>

if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
  let g:unite_source_grep_recursive_opt = ''
endif

" ============================================================================
" Syntastic config
"

let g:syntastic_enable_signs = 1 " mark syntax errors with :signs

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ============================================================================

set history=1000 " store lots of :cmdline history

set showcmd      " show incomplete cmds down the bottom
set showmode     " show current mode down the bottom

set incsearch    " find the next match as we type the search
set hlsearch     " hilight searches by default

set number       " add line numbers
set showbreak=...
set wrap linebreak nolist

" turn off needless toolbar on gvim/mvim
set guioptions-=T
" turn off the scroll bar
set guioptions-=L
set guioptions-=r

" indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" folding settings
set foldmethod=indent " fold based on indent
set foldnestmax=3     " deepest fold is 3 levels
set nofoldenable      " dont fold by default

set wildmode=list:longest         " make cmdline tab completion similar to bash
"set wildmenu                      " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.pyc " stuff to ignore when tab completing

" load ftplugins and indent files
filetype plugin on
filetype indent on

" turn on syntax highlighting
syntax on

" activate smartcase
set ic
set smartcase

if has("gui_running")
    " tell the term has 256 colors
    set t_Co=256

    colorscheme molokai
    set guitablabel=%M%t
    set lines=40
    set columns=115

    if has("gui_gnome") || has("gui_gtk2")
        colorscheme railscasts
        set guifont=Ubuntu\ Mono\ 10
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h12
        set transparency=7
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
else
    " dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    " set railscasts colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme molokai
    else
        if $TERM == 'xterm'
            set t_Co=256
            colorscheme molokai
        else
            colorscheme default
        endif
    endif
endif

" key mapping for Gundo
nnoremap <F4> :GundoToggle<CR>

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

" make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" turn on highlight for column 81 (marking an 80 character line)
" vim 7.3+ required
set colorcolumn=81
" set the color to grey to go better with default theme
highlight ColorColumn ctermbg=8 guibg=grey

" more syntax highlighting for python
let python_hightlight_all = 1

" key mapping for exiting terminal (Neovim)
if has("nvim")
  tmap <C-A> <C-\><C-N>
else
  " if not neovim set :term to use Conque
  cabbrev term ConqueTerm bash
endif
