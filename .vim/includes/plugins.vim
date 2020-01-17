" Plugin and autoload configuration
" Autoload vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize vim-plug, and add plugins
call plug#begin()

Plug 'junegunn/vim-plug'
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'christoomey/vim-tmux-navigator'

Plug 'sheerun/vim-polyglot'

Plug 'ryanoasis/vim-devicons'

Plug 'tssm/fairyfloss.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Rigellute/shades-of-purple.vim'

call plug#end()

