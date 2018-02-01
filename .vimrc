" LAUNCH CONFIG {{{
call pathogen#infect()        " use pathogen
filetype plugin indent on
syntax on
" }}}

" COLORS {{{
syntax enable                 " enable syntax processing
let g:solarized_termtrans = 1 " allow for transparent terminal emulator
set background=dark           " use dark version of the theme
colorscheme solarized         " awesome colorscheme
" }}}

" SPACES AND TABS {{{
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set modelines=1         " turn modelines on
" }}}

" UI CONFIG {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " hightlight matching [{()}]
" }}}

" SEARCHING {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" FOLDING {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold mas
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" }}}

" MOVEMENT {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beggining/end o fline
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" higligh last inserted text
nnoremap gV `[v`]
" }}}

" LEADER SHORTCUTS {{{
let mapleader=","       " leader is comma
" jk is escape
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session
nnoremap <leader>s :mksession<CR>
" open ag.vim
nnoremap <leader>a :Ag
" }}}

" BACKUPS {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" vim:foldmethod=marker:foldlevel=0
