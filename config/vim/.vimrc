" Vimrc


" Automatically source vimrc on save.
autocmd bufwritepost $MYVIMRC source $MYVIMRC


" LEADER SHORTCUTS
" ----------------
let mapleader=","
inoremap jk <esc>
vnoremap kj <esc>
nmap <leader>v :tabedit $MYVIMRC<CR>


" VUNDLE PRE-CONFIGURATION
" ------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'


" PLUGINS
" -------
Plugin 'tomasiser/vim-code-dark'
Plugin 'ngmy/vim-rubocop'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'craigemery/vim-autotag'
Plugin 'vim-syntastic/syntastic'
Plugin 'jgdavey/tslime.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'


" VUNDLE POST-CONFIGURATION
" -------------------------
call vundle#end()


" COLORS
" ------
colorscheme codedark        " awesome colorscheme
syntax enable               " enable syntax processing


" PASTE MODE
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


" SPACES AND TABS
" ---------------
set tabstop=2               " number of visual spaces per TAB
set softtabstop=2           " number of spaces in tab when editing
set expandtab               " tabs are spaces


" UI CONFIG
" ---------
set number                  " show line numbers
set hlsearch                " highlight all search matched
filetype plugin indent on   " load filetype-specific indent files

" Nerdtree
noremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowHidden=1

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Remove trailing whitespace on filesave
set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \
autocmd BufWritePre * %s/\s\+$//e

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"


" CTRL-P CONFIG
" -------------
set shell=/bin/bash

" Only update results when typing has stopped
let g:ctrlp_lazy_update = 1

" Update default mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Set the local working directory
let g:ctrlp_working_path_mode = 'ra'

" If a file is already open, open it again in a new pane instead of switching
" to the existing pane
let g:ctrlp_switch_buffer = 'et'

" Exclude files and directories using Vim's wildignore and CtrlP's own
" g:ctrlp_custom_ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif


" CTAGS
" -----

nnoremap <leader>. :CtrlPTag<cr>


" RSPEC TESTING
" ------------

nmap <Leader>rt <Plug>SetTmuxVars
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

