" => Chapter 1: Getting Started --------------------------------------- {{{

syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.

set backspace=2            " Fix backspace behavior on most terminals.

colorscheme gruvbox        " Change a colorscheme.
set background=dark
" colorscheme PaperColor   " Alternative colorscheme

set noswapfile

" set number
set nu 
set relativenumber
set cursorline
set hlsearch
set incsearch

packloadall                     " Load all plugins.
silent! helptags ALL            " Load help files for all plugins.

" Navigate windows with <Ctrl-hjkl> instead of <Ctrl-w> followed by hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" --- FoldMethod ---
" set foldmethod=indent           " Indentation-based folding.
autocmd FileType javascript setlocal foldmethod=expr
autocmd FileType javascript setlocal foldexpr=JSFolds()
" --- end FoldMethod --- 

set wildmenu                    " Enable enhanced tab autocomplete.
set wildmode=list:longest,full  " Complete till longest string,
                                
" --- Manage plugins with vim-plug ---
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-vinegar'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'mileszs/ack.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
    Plug 'vim-airline/vim-airline'
    Plug 'mattn/emmet-vim'

    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Autocomplete
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

    " Fugitive is the premier Vim plugin for Git.
    Plug 'tpope/vim-fugitive'

    Plug 'christoomey/vim-tmux-navigator'

    " Plugin spotlight: vim-dispatch
    Plug 'tpope/vim-dispatch'

    " Plugin spotlight – vim-test
    Plug 'vim-test/vim-test'

    " Plugin spotlight – Syntastic
    Plug 'vim-syntastic/syntastic'

    Plug 'w0rp/ale'

call plug#end()
" --- end Manage plugins with vim-plug ---

" --- Plug 'scrooloose/nerdtree' ---
" let NERDTreeHijackNetrw = 0

" Autoclose NERDTree if it's the only open window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
  \ b:NERDTree.isTabTree()) | q | endif

" Map the leader key to a comma.
let mapleader = ','

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
" --- end Plug 'scrooloose/nerdtree' ---

" --- for Plug 'junegunn/goyo.vim' ---
let g:goyo_width = 60
let g:limelight_default_coefficient = 0.7
let g:limeLight_paragraph_span = 1

map <leader>gy :Goyo<CR>
map <leader>ll :Limelight!!<CR>
autocmd! User GoyoEnter Limelight 
autocmd! User GoyoLeave Limelight!
" --- end for Plug 'junegunn/goyo.vim' ---

" --- Plug 'ctrlpvim/ctrlp.vim' ---
" nnoremap <C-b> :CtrlPBuffer<cr>   " Map CtrlP buffer mode to Ctrl + B.
" --- end Plug 'ctrlpvim/ctrlp.vim' ---

"------ Cursor -----
" set ttimeoutlen=10 "Знижуємо затримку введення escape послідовностей
   
let &t_SI = "\<Esc>]12;yellow\x7"
let &t_SR = "\<Esc>]12;red\x7"
let &t_EI = "\<Esc>]12;blue\x7"
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"                                                                   
endif
 " 2 -> solid block
 " 1 or 0 -> blinking block
 " 3 -> blinking underscore
 " Recent versions of xterm (282 or above) also support
 " 5 -> blinking vertical bar
 " 6 -> solid vertical bar
"----- end Cursor -----

" ----- Airline -----
let g:airline_powerline_fonts = 1 "Включити підтримку Powerline шрифтів
let g:airline#extensions#keymap#enabled = 0 "Не показувати поточний маппинг
let g:airline_section_z="\ue0a1:%l /%L Col:%c" "кастомна графа положення курсора
let g:Powerline_symbols='unicode' "Підтримка unicode
" ----- end Airline -----
set guifont=Fira\Code\Light\Nerd\Font\Complete:h16

" --- YouCompleteMe: a code-completion engine for Vim ---
let g:plug_timeout = 300 " Increase vim-plug timeout for YouCompleteMe
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

noremap <leader>] :YcmCompleter GoTo<cr
" --- end YouCompleteMe: a code-completion engine for Vim ---

let g:tmux_navigator_no_mappings = 1

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

nnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Default to not read-only in vimdiff
set noro

" Terminal mode
tnoremap <c-j> <c-w><c-j>
tnoremap <c-k> <c-w><c-k>
tnoremap <c-l> <c-w><c-l>
tnoremap <c-h> <c-w><c-h>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_pylint_exe = 'pylint3'
let g:ale_completion_enabled = 1
