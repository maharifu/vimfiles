" ============================================================================
" Vundle init and config
"
set nocompatible " be iMproved, required
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'                " the plug-in manager for Vim

Plugin 'vim-airline/vim-airline'          " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'   " A collection of themes for vim-airline
Plugin 'scrooloose/nerdtree'              " A tree explorer plugin for vim.
Plugin 'scrooloose/syntastic'             " Syntax checking hacks for vim
Plugin 'tpope/vim-fugitive'               " a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-commentary'             " comment stuff out
Plugin 'tpope/vim-surround'               " quoting/parenthesizing made simple
Plugin 'tpope/vim-rails'                  " Ruby on Rails power tools
Plugin 'tpope/vim-abolish'                " easily search for, substitute, and abbreviate multiple variants of a word
Plugin 'tmhedberg/matchit'                " extended % matching for HTML, LaTeX, and many other languages
Plugin 'henrik/vim-indexed-search'        " Show 'Match 123 of 456 /search term/' in Vim searches.
Plugin 'lrvick/Conque-Shell'              " Run interactive commands inside a Vim buffer
Plugin 'elzr/vim-json'                    " A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
Plugin 'mbbill/undotree'                  " The ultimate undo history visualizer for VIM
Plugin 'terryma/vim-multiple-cursors'     " True Sublime Text style multiple selections for Vim
Plugin 'Shougo/unite.vim'                 " Unite and create user interfaces
Plugin 'Shougo/neomru.vim'                " MRU plugin includes unite.vim MRU sources
Plugin 'Shougo/vimproc.vim'               " Interactive command execution in Vim.
Plugin 'junegunn/vim-easy-align'          " A Vim alignment plugin
Plugin 'hail2u/vim-css3-syntax'           " Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
Plugin 'mustache/vim-mustache-handlebars' " mustache and handlebars mode for vim
Plugin 'leafgarland/typescript-vim'       " Typescript syntax files for Vim
Plugin 'godlygeek/csapprox'               " Make gvim-only colorschemes work transparently in terminal vim http://www.vim.org/scripts/script.php?script_id=2390
Plugin 'thinca/vim-localrc'               " Enable configuration file of each directory.
Plugin 'craigemery/vim-autotag'           " Automatically discover and 'properly' update ctags files on save
Plugin 'vim-utils/vim-man'                " View and grep man pages in vim
Plugin 'ekalinin/Dockerfile.vim'          " Vim syntax file & snippets for Docker's Dockerfile
Plugin 'will133/vim-dirdiff'              " Vim plugin to diff two directories

" All of your Plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " load ftplugins and indent files

" ============================================================================
" localrc config
"
let g:localrc_filename = '.local.vimrc'

" ============================================================================
" Airline config
"

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" old vim-powerline symbols
let g:airline_left_sep         = '⮀'
let g:airline_left_alt_sep     = '⮁'
let g:airline_right_sep        = '⮂'
let g:airline_right_alt_sep    = '⮃'
let g:airline_symbols.branch   = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr   = '⭡'

" required so the status bar actually shows
set laststatus=2

" ============================================================================
" Unite config
"

nnoremap <silent> <Leader>m :Unite -direction=botright -buffer-name=recent
                                 \ -winheight=10 file_mru<cr>
nnoremap <silent> <C-b> :Unite -direction=botright -buffer-name=buffers
                                 \ -winheight=10 buffer<cr>
nnoremap <silent> <C-f> :Unite -direction=botright -no-quit grep:.<cr>

" CtrlP search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec,file_rec/async,file_rec/neovim','sorters','sorter_rank')
call unite#custom#source('file_rec,file_rec/async,file_rec/neovim', 'ignore_pattern', 'node_modules\|.sass-cache')

if has("nvim")
  " if neovim is installed and working, use neovim's job APIs
  nnoremap <silent> <C-p> :Unite -direction=botright -start-insert
                               \ -buffer-name=files -winheight=10
                               \ file_rec/neovim<cr>
else
  " replacing unite with ctrl-p
  " check for vimproc, silence 'missing DLL error'
  silent! if unite#util#has_vimproc()
    " if vimproc is installed and working, use async
    nnoremap <silent> <C-p> :Unite -direction=botright -start-insert
                                 \ -buffer-name=files -winheight=10
                                 \ file_rec/async<cr>
  else
    " else, use normal call
    nnoremap <silent> <C-p> :Unite -direction=botright -start-insert
                                 \ -buffer-name=files -winheight=10 file_rec<cr>
  end
end

if executable('ag')
  " ag is faster so make it default
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
      \ '-i --vimgrep --hidden --ignore ' .
      \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
else
  if executable('ack')
    " ack is still faster than grep
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
  endif
endif

" ============================================================================
" Syntastic config
"

let g:syntastic_enable_signs = 1 " mark syntax errors with :signs

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Reenable go checkers
let g:syntastic_go_checkers = ["go"]

" ============================================================================
" EasyAlign config
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
set wildignore=*.o,*.obj,*~,*.pyc " stuff to ignore when tab completing

" turn on syntax highlighting
syntax on

" activate smartcase
set ignorecase smartcase

if has("gui_running")
  " tell the term has 256 colors
  set t_Co=256

  colorscheme molokai
  set guitablabel=%M%t
"  set lines=40
"  set columns=115

  if has("gui_gnome") || has("gui_gtk2") || has("gui_gtk3")
    colorscheme railscasts
    set guifont=Hack\ Regular\ 9
  endif

  if has("gui_mac") || has("gui_macvim")
    colorscheme railscasts
    set guifont=Hack:h11
  endif

  if has("gui_win32") || has("gui_win32s")
    set guifont=Consolas:h12
    set enc=utf-8
  endif
else
  " dont load csapprox if there is no gui support - silences annoying warning
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    set t_Co=256
  endif

  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=

  colorscheme molokai
endif

" key mapping for Gundo
nnoremap <F4> :UndotreeToggle<CR>

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$']

" make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

" turn on highlight for column 81 (marking an 80 character line)
" vim 7.3+ required
set textwidth=80
set colorcolumn=+1
" set the color to grey to go better with default theme
highlight ColorColumn ctermbg=8 guibg=grey

" more syntax highlighting for python
let python_hightlight_all = 1

" key mapping for exiting terminal (Neovim)
if has("nvim")
  tmap <Esc> <C-\><C-N>
else
  " if not neovim set :term to use Conque
  cabbrev term ConqueTerm bash
endif

" Disable syntastic on LaTeX files
let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['tex', 'plaintex'] }
" Quick mode toggle
nnoremap <C-w>E :SyntasticToggleMode<CR>

" Open new tabs quicker
nnoremap <Leader><Tab> :tabnew<CR>

" set .axlsx files to ruby syntax
autocmd BufRead,BufNewFile *.axlsx set filetype=ruby

" Close all buffers
command Bw :bufdo bw

" Save as root
command W w !sudo tee % > /dev/null

" For performance reasons
set synmaxcol=200

" Because K in gvim sucks
if &runtimepath =~ 'vim-man'
  map K <Plug>(Man)
endif

" Undo since forever!
if has("persistent_undo")
  let undo = expand('$HOME/.vim.undo')
  silent call system('mkdir -p ' . undo)
  let &undodir = undo
  set undofile
endif
