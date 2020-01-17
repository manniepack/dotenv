set nocompatible

source ~/.vim/includes/plugins.vim

" System {{{

    set lazyredraw " don't redraw between commands
    set updatetime=300
    set hid " hide unseen buffers instead of closing

    if &history < 1000
        set history=1000
    endif

    set t_Co=256
    if &term =~ '256color'
        set t_ut= "disable background color erase
    endif

    set path+=** " search in subdirectories (recursive)

    " Temporary Directories  {{{

        " Swap and temporary file in discreet location
        set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
        set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
        set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

    " }}}

    set backspace=indent,eol,start " correct <bs> on macOS
    set clipboard=unnamed " use default clipboard on macOS
    set encoding=utf8 ffs=unix,dos,mac

    " Status Bar and Command Menu  {{{

        " set ruler " show line information in status
        set laststatus=2
        set showcmd " Show commands as they are typed
        set noshowmode " disable mode display (in favor of *line plugins)
        set wildmenu " enable cool *wildcard menu

    " }}}

    " Alerts and Notifications  {{{

        set noerrorbells " disable audio error bells
        set visualbell " enable visual bell
        set t_vb= " set visual bell character (to nothing)
    
    " }}}

    " Compound and Key Map Timeout  {{{

        set timeoutlen=500
        if !has('nvim') && &ttimeoutlen == -1
            set ttimeout " enable compound map/keybind timeout
            set ttimeoutlen=100
        endif

    " }}}

    " Splits  {{{

        set splitbelow
        set splitright

    " }}}

    if has('autocmd')
        " Enable filetype plugins, indents, and detection
        filetype plugin indent on
    endif

" }}}

" Editor {{{

    if has('syntax') && !exists('g:syntax_on')
        syntax enable
    endif

    set nu rnu nuw=4 " configure line numbering

    set list
    set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
    set showbreak=↪

    " Linewrap {{{

        set whichwrap+=<,>,h,l
        set lbr tw=120 " configure automatic line-breaks

    " }}}

    " Tabs  {{{

        set expandtab ts=4 sts=4 shiftwidth=4 sr " configure tab expansion
        "" autoindent (ai) matches newline with current indent
        "" smartindent (si) behaves naturally in nests/blocks
        set ai si " automatic line-indentation

    " }}}

    " Code-Folding  {{{

        set foldmethod=marker " create folds on marker
        set foldlevelstart=99
        set foldnestmax=10 " deepest fold is 10 levels
        set nofoldenable " don't fold by default
        set foldlevel=1

    " }}}

    " Search {{{

        if !has('magic')
            set magic
        endif

        set ic scs gd " globalize and auto-case all search
        set is hls " highlight search matches
        set matchtime=2

    " }}}

    " Appearance {{{

        if (has("termguicolors"))
            let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
            let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
            set termguicolors " enable 24-bit color support
        endif

        colorscheme palenight

        let g:shades_of_purple_lightline=1
        let g:lightline={
        \   'colorscheme': 'palenight',
        \   'active': {
        \     'left':[ [ 'mode', 'paste' ],
        \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
        \     ]
        \   },
            \   'component': {
            \     'lineinfo': ' %3l:%-2v',
            \   },
        \   'component_function': {
        \     'gitbranch': 'fugitive#head',
        \   }
        \ }
        let g:lightline.separator={
            \   'left': '', 'right': ''
        \}
        let g:lightline.subseparator={
            \   'left': '', 'right': ''
        \}

    " }}}

" }}}

" Keybinds {{{

    let mapleader=','

    " Quick-Select {{{
        noremap <space> viw
        noremap <space><space> v$
    " }}}

    " Shift Lines {{{
        noremap - ddp
        noremap _ ddkP
    " }}}

    " Hard-Mode {{{

        nnoremap <up> <nop>
        nnoremap <down> <nop>
        nnoremap <left> <nop>
        nnoremap <right> <nop>
        inoremap <up> <nop>
        inoremap <down> <nop>
        inoremap <left> <nop>
        inoremap <right> <nop>
        nnoremap j gj
        nnoremap k gk
        
    " }}}

    " Quick-Edit: ~/.vimrc {{{

        noremap <leader>ev :vsplit $MYVIMRC<cr>
        noremap <leader>sv :source $MYVIMRC<cr>

    " }}}
    
    " Remap Default Search {{{

        nnoremap / /\v
        vnoremap / /\v
        nnoremap <leader><space> :noh<cr>

    " }}}

    " Pane Navigation {{{

        nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

    " }}}
" }}}

set grepprg=grep\ -nnH\ $*

