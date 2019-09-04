set nocompatible
syntax on " enable syntax highlighting
filetype off " required by Vundle
" color scheme
set background=dark
colorscheme solarized

set backspace=2         " fixing backspace?
set ff=unix             " to compensate windows line endings for syntax file
set ruler               " show ruler bar
set showcmd 	    	" show command in ruler bar
set number              " show line number
set autoindent          " automatically indent line
set tabstop=4           " indentation equal 4 spaces
set expandtab           " converting tab to spaces
set shiftwidth=4        " auto indenting 4 spaces
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set colorcolumn=80      " 80 seems to be the most reasonble text width
set pastetoggle=<F2>    " toggle auto indent
set path+=**            " file searches all the sub-directories
set foldmethod=syntax   " auto fold
set foldlevelstart=20

" Set up for cursor
"This enables iterm cursor changes from vim. In .tmux.conf you'll need:
" set-option -g terminal-overrides '*88col*:colors=88,*256col*:colors=256,xterm*:XT:Ms=\E]52;%p1%s;%p2%s\007:Cc=\E]12;%p1%s\007:Cr=\E]112\007:Cs=\E]50;CursorShape=%?%p1%{3}%<%t%{0}%e%p1%{2}%-%;%d\007'
"
" Source: https://github.com/Casecommons/casecommons_workstation/blob/master/templates/default/dot_tmux.conf.erb
"         https://github.com/Casecommons/vim-config/blob/master/init/tmux.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[6 q"
    let &t_EI = "\<Esc>[2 q"
    let &t_SR = "\<Esc>[4 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  endif
else
    let &t_SI = "\<Esc>[6 q"
    let &t_EI = "\<Esc>[2 q"
    let &t_SR = "\<Esc>[4 q"
endif

set timeoutlen=1000 " fixing the cursor change lag
set ttimeoutlen=0   " fixing the cursor change lag

" remap keys for buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" remap keys for ctags
nnoremap <F5> :!ctags -R<CR>

nnoremap <CR> o<Esc>

" snippets
nnoremap ,main :-1read $HOME/.vim/skeletons/main.cpp<CR>2jdjjA
nnoremap ,cpptest :-1read $HOME/.vim/skeletons/main.cpp<CR>5jA
nnoremap ,for :-1read $HOME/.vim/skeletons/for.cpp<CR>=2jf(a
nnoremap ,if :-1read $HOME/.vim/skeletons/if.cpp<CR>=2jf(a
nnoremap ,while :-1read $HOME/.vim/skeletons/while.cpp<CR>=2jf(a
nnoremap ,makefile :-1read $HOME/.vim/skeletons/Makefile<CR>
    " lorem html sample text
nnoremap ,lorem :-1read $HOME/.vim/skeletons/lorem.txt<CR>
nnoremap ,html :-1read $HOME/.vim/skeletons/htmlstart.html<CR>3jf>li
nnoremap ,hcomm :-1read $HOME/.vim/skeletons/hcomment.html<CR>^2f-a
nnoremap ,csslink :-1read $HOME/.vim/skeletons/csslink.html<CR>f.i

let g:cpp_class_scope_highlight = 1

" ########################### Vundle Bundles #################################

" set the runtime path to include Vundle and initialize
" Run :PluginInstall to install all
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" For typescript syntax highlighting
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt-=preview
Plugin 'scrooloose/nerdtree'
Plugin 'moll/vim-node'
Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Z>'   "leader key for emmet

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
