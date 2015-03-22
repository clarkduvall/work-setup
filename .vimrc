set nocompatible

" vundle
filetype off
set rtp+=~/.fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'gregsexton/MatchTag'
Plugin 'groenewege/vim-less'
Plugin 'henrik/vim-indexed-search'
Plugin 'kchmck/vim-coffee-script'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'yssl/QFEnter'

call vundle#end()

syntax on
filetype plugin indent on

set autoindent
set showmode
set number
set smartindent
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set backspace=2
set hlsearch
set textwidth=100
set formatoptions=nqro
colorscheme tchaba2

" Undo file.
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Highlight column 81.
set colorcolumn=101
highlight ColorColumn ctermbg=3

" Highlight extra whitespace and tabs.
highlight ExtraWhitespace ctermbg=3
match ExtraWhitespace /\s\+$\|\t\+/
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=3

" Remember last cursor position.
set viminfo='10,\"100,:20,%,n~/.viminfo
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g'\"" | endif

" Use tab to navigate splits.
nnoremap <tab> <C-w><C-w>
nnoremap <s-tab> <C-w><left>

" Move multiple lines at once.
nnoremap <C-j> 10j
nnoremap <C-k> 10k
nnoremap <C-l> 10l
nnoremap <C-h> 10h
vnoremap <C-j> 10j
vnoremap <C-k> 10k
vnoremap <C-l> 10l
vnoremap <C-h> 10h

vnoremap <C-Y> "+y
nnoremap <C-Y> "+yy
noremap <C-P> "+p

nnoremap <space><space> vip:sort<cr>

noremap <space>: :sort<cr>gv:Tabularize /:<cr>gv:s/ :/:/g<cr>:noh<cr>
noremap <space>= :Tabularize /^[^=]*\zs=<cr>


" Make Y work like D.
nnoremap Y y$

" NERDTree.
noremap <C-n> :NERDTreeToggle<cr>
let g:NERDTreeDirArrows=0

" For NERDCommenter.
let mapleader = ","
let g:NERDSpaceDelims = 1
let g:syntastic_debug = 0

let g:ctrlp_max_height = 20

" Bash style completion.
set wildmode=list:longest
set wildmenu

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_coffee_coffeelint_args = "--csv --file ~/src/BetterWorks/appfiles/coffeelint.json"

cab Wq wq
cab W w
cab WQ wq
cab Q q
cab Vs vs
cab VS vs
cab Qa qa
cab QA qa
cab t Tabularize

" grep fun
cab gg Ggrep!
autocmd QuickFixCmdPost *grep* cwindow
autocmd FileType qf wincmd J

function Ext()
  return expand("%:e")
endfunction

function SimpleFind()
  return 'Ggrep! "' . @" . '" -- "*.' . Ext() . '"'
endfunction

function FindDefinition()
  let text=@""
  return 'Ggrep! -e "\(def\|class\) ' . text . '\b" -e "\b' . text . '\b\s\+=" -e "\(factory\|service\|directive\|controller\) ''' . text . '''" -- "*.' . Ext() . '"'
endfunction

vnoremap <C-f> y:<C-r>=SimpleFind()<cr><cr><cr>gv
nnoremap <C-f> yiw:<C-r>=SimpleFind()<cr><cr><cr>
vnoremap <C-g> y:<C-r>=FindDefinition()<cr><cr><cr>gv
nnoremap <C-g> yiw:<C-r>=FindDefinition()<cr><cr><cr>

" vim-airline
set laststatus=2
set noshowmode
let g:airline_theme='raven'

" tagbar
" nnoremap <C-i> :TagbarToggle<cr>

" gundo
let g:gundo_preview_bottom=1

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

nnoremap <silent> <leader><cr> :call fzf#run({
\   'down': '40%',
\   'sink': 'vertical split' })<cr>
nnoremap <silent> <leader><space> :call fzf#run({
\   'down': '40%',
\   'sink': 'sp' })<cr><c-w>=
nnoremap <silent> <c-p> :FZF<cr>
