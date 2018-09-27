set nocompatible
syntax on " enable syntax highlighting
filetype on
filetype plugin on
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
nnoremap <f5> :!ctags -R<CR>

nnoremap <CR> o<Esc>

" snippets
nnoremap ,main :read $HOME/.vim/skeletons/main.cpp<CR>kddjdj2jA
nnoremap ,cpptest :read $HOME/.vim/skeletons/main.cpp<CR>kdd5jA
nnoremap ,for :read $HOME/.vim/skeletons/for.cpp<CR>=2jf(a
nnoremap ,if :read $HOME/.vim/skeletons/if.cpp<CR>=2jf(a
nnoremap ,while :read $HOME/.vim/skeletons/while.cpp<CR>=2jf(a
nnoremap ,makefile :read $HOME/.vim/skeletons/Makefile<CR>kdd
nnoremap ,lorem :read $HOME/.vim/skeletons/lorem.txt<CR>     " lorem html text
nnoremap ,tag <ESC><ESC>bi<<ESC>ea><ESC>F<yf>f>pF<a/<ESC>F<i

let g:cpp_class_scope_highlight = 1
