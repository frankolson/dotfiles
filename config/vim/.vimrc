" Vimrc

set nocompatible
filetype off

filetype plugin indent on
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'posva/vim-vue'
Plugin 'kchmck/vim-coffee-script'
" vim-snipmate dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" End vim-snipmate dependencies
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Auto set vue file type, plugin is broken
autocmd BufNewFile,BufRead *.vue set ft=vue
autocmd BufNewFile,BufRead *.coffee set ft=coffee

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let mapleader = "\<Space>"

" GENERAL
" -------
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set expandtab
set shiftwidth=2
set softtabstop=2

" Display relative line numbers, with absolute line number for current line
set number
set numberwidth=5

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

" VISUAL
" ------

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Open new split panes to right and bottom
set splitbelow
set splitright

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" CONVIENENCE
" -----------
imap <C-@> <esc>:w<cr>

" Rapid editing of vimrc
nmap <leader>vr :vsp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

" autocmd VimEnter * NERDTree " launch NERDTree on startup
nnoremap <leader>nt :NERDTree<cr>
let g:NERDTreeNodeDelimiter = "\u00a0"

" GREPPING (with The Silver Searcher)
" -----------------------------------
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Make CtrlP use ag for listing the files. Way faster and no useless files.
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" search for word under cursor
nnoremap <leader>K :grep! "\b\s?<C-R><C-W>\b"<CR>:cw<CR>
