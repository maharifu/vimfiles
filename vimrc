" ============================================================================
" Plugins init and config
"
set nocompatible " be iMproved, required
" filetype off     " required
" enable filetype detection:
filetype on
filetype plugin on
filetype indent on " file type based indentation

" Force python3 to be active
set pyx=3
let g:ignore_me = has('python3')

" Install vim-plug if missing
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'          " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'   " A collection of themes for vim-airline
Plug 'scrooloose/nerdtree'              " A tree explorer plugin for vim.
Plug 'Xuyuanp/nerdtree-git-plugin'      " A plugin of NERDTree showing git status
Plug 'w0rp/ale'                         " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
Plug 'tpope/vim-fugitive'               " a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-commentary'             " comment stuff out
Plug 'tpope/vim-surround'               " quoting/parenthesizing made simple
Plug 'tpope/vim-rails'                  " Ruby on Rails power tools
Plug 'tpope/vim-abolish'                " easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tmhedberg/matchit'                " extended % matching for HTML, LaTeX, and many other languages
Plug 'henrik/vim-indexed-search'        " Show 'Match 123 of 456 /search term/' in Vim searches.
Plug 'elzr/vim-json'                    " A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.
Plug 'mbbill/undotree'                  " The ultimate undo history visualizer for VIM
Plug 'Shougo/denite.nvim'               " Dark powered asynchronous unite all interfaces for Neovim/Vim8
Plug 'roxma/nvim-yarp'                  " Yet Another Remote Plugin Framework for Neovim
Plug 'roxma/vim-hug-neovim-rpc'         " EXPERIMENTAL
Plug 'Shougo/neomru.vim'                " MRU plugin includes unite.vim MRU sources
Plug 'junegunn/vim-easy-align'          " A Vim alignment plugin
Plug 'hail2u/vim-css3-syntax'           " Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
Plug 'mustache/vim-mustache-handlebars' " mustache and handlebars mode for vim
Plug 'leafgarland/typescript-vim'       " Typescript syntax files for Vim
Plug 'godlygeek/csapprox'               " Make gvim-only colorschemes work transparently in terminal vim http://www.vim.org/scripts/script.php?script_id=2390
Plug 'thinca/vim-localrc'               " Enable configuration file of each directory.
Plug 'craigemery/vim-autotag'           " Automatically discover and 'properly' update ctags files on save
Plug 'vim-utils/vim-man'                " View and grep man pages in vim
Plug 'ekalinin/Dockerfile.vim'          " Vim syntax file & snippets for Docker's Dockerfile
Plug 'will133/vim-dirdiff'              " Vim plugin to diff two directories
Plug 'fatih/vim-go',                    " Go development plugin for Vim https://patreon.com/fatih
    \ { 'do': ':GoUpdateBinaries' }
Plug 'christoomey/vim-conflicted'       " Easy git merge conflict resolution in Vim
Plug 'KabbAmine/zeavim.vim'             " Zeal for Vim
Plug 'ivy/vim-ginkgo'                   " Go syntax highlighting and snippets for Ginkgo specs and matchers. https://github.com/ivy/vim-ginkgo
Plug 'hashivim/vim-terraform'           " basic vim/terraform integration http://hashivim.github.io/vim-terraform
Plug 'rhysd/clever-f.vim'               " Extended f, F, t and T key mappings for Vim. https://rhysd.github.io/clever-f.vim
Plug 'rust-lang/rust.vim'               " Vim configuration for Rust.
Plug 'ervandew/supertab'                " Perform all your vim insert mode completions with Tab

" All of your Plugins must be added before the following line
call plug#end()

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" ============================================================================
" Vim-go
"
" let g:go_version_warning = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

let g:go_build_tags = 'gopls'
" disable preview window
set completeopt-=preview

let g:go_list_height = 10

nnoremap <silent> <Leader>i :GoImplements<cr> :lopen<cr>

" ============================================================================
" rust.vim
"

let g:rustfmt_autosave = 1

" ============================================================================
" Conflicted config
"
set stl+=%{ConflictedVersion()}
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'

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

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" required so the status bar actually shows
set laststatus=2

" ============================================================================
" Unite config
"
" nnoremap <silent> <C-m> :Denite -direction=botright -buffer-name=recent
"       \ -winheight=10 file_mru<cr>
nnoremap <silent> <C-b> :Denite -direction=botright -buffer-name=buffers
      \ -winheight=10 buffer<cr>
nnoremap <silent> <C-p> :Denite -direction=botright -buffer-name=files
      \ -start-filter -winheight=10 file/rec<cr>
nnoremap <silent> <C-f> :Denite -direction=botright grep:.<cr>
nnoremap <expr> <C-g> ':Denite -direction=botright -input='.expand('<cword>').' grep:.<cr>'

" Unmap Denite's default enter action
" unmap <CR>

" CtrlP search
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \ 'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
      \ 'node_modules', '.sass-cache', 'vendor'])

call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
endfunction

if executable('rg')
  " rg is fastest so make it default
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--files', '--glob', '!.git'])

  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

" ============================================================================
" ALE config
"
let g:ale_fix_on_save = 1

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'go': ['gopls', 'golangci-lint'],
      \ 'proto': ['protolint']}
let g:ale_fixers = {'go': ['goimports']}
let g:ale_go_golangci_lint_package = 1
" Disable virtualtext - comment-style text on errors or warnings
let g:ale_virtualtext_cursor = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ============================================================================
" EasyAlign config
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ============================================================================
" Zeavim config
"

let g:zv_keep_focus = 0

" ============================================================================
" vim-terraform config
"

let g:terraform_fmt_on_save = 1

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

" Quick mode toggle
nnoremap <C-w>E :ALEToggle<CR>

" Open new tabs quicker
nnoremap <Leader><Tab> :tabnew<CR>

" set .axlsx files to ruby syntax
autocmd BufRead,BufNewFile *.axlsx set filetype=ruby

" Close all buffers
command! Bw :bufdo bw

" Save as root
command! W w !sudo tee % > /dev/null

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

" More powerful backspacing
set backspace=indent,eol,start

" Enable bracketed paste mode
set t_BE=

" tmux integration
if $TMUX != ''
  " integrate movement between tmux/vim panes/windows

  fun! TmuxMove(direction)
    " Check if we are currently focusing on a edge window.
    " To achieve that,  move to/from the requested window and
    " see if the window number changed
    let oldw = winnr()
    silent! exe 'wincmd ' . a:direction
    let neww = winnr()
    silent! exe oldw . 'wincmd w'
    if oldw == neww
      " The focused window is at an edge, so ask tmux to switch panes
      if a:direction == 'j'
        call system("tmux select-pane -D")
      elseif a:direction == 'k'
        call system("tmux select-pane -U")
      elseif a:direction == 'h'
        call system("tmux select-pane -L")
      elseif a:direction == 'l'
        call system("tmux select-pane -R")
      endif
    else
      exe 'wincmd ' . a:direction
    end
  endfun

  nnoremap <silent> <c-w>j :silent call TmuxMove('j')<cr>
  nnoremap <silent> <c-w>k :silent call TmuxMove('k')<cr>
  nnoremap <silent> <c-w>h :silent call TmuxMove('h')<cr>
  nnoremap <silent> <c-w>l :silent call TmuxMove('l')<cr>
  nnoremap <silent> <c-w><down> :silent call TmuxMove('j')<cr>
  nnoremap <silent> <c-w><up> :silent call TmuxMove('k')<cr>
  nnoremap <silent> <c-w><left> :silent call TmuxMove('h')<cr>
  nnoremap <silent> <c-w><right> :silent call TmuxMove('l')<cr>
endif

" Disable modeline
set nomodeline
