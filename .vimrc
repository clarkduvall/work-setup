set nocompatible

syntax on
filetype plugin on
filetype indent on
autocmd BufRead,BufNewFile *.py filetype plugin off

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
set bg=dark

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

noremap <space>: :sort<cr>gv:Tabularize /:<cr>gv:s/ :/:/g<cr>:nohl<cr>
noremap <space>= :Tabularize /=<cr>

map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


" Make Y work like D.
nnoremap Y y$

" Create newlines in normal mode.
nnoremap <cr> o<esc>

" Pathogen fun.
call pathogen#infect()

" NERDTree.
noremap <C-n> :NERDTreeToggle<cr>
let g:NERDTreeDirArrows=0

" For NERDCommenter.
let mapleader = ","
let g:NERDSpaceDelims = 1
let g:syntastic_debug = 0

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
